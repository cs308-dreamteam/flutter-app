import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_variables.dart';

class Client {
  // Client class allows for easier request intervention and dynamic uri.

  // Url to be used in all requests.
  // localhost is 10.0.2.2 in emulators.
  String url = "10.0.2.2";

  Future<http.StreamedResponse> send({
    required String method,
    dynamic body,
    Map<String, String>? headers,
    Encoding encoding = const Utf8Codec(),
    bool followRedirects = true,
    bool persistentConnection = true,
    int maxRedirects = 5,
    Uri? uri,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) {
    uri = uri ??
        Uri(
            scheme: 'http',
            host: url,
            port: 3000,
            path: path,
            queryParameters: queryParameters);
    var req = http.Request(method, uri);
    req.headers['Content-Type'] = 'application/json';
    req.headers['x-access-token'] = GlobalVariables.authentication.token ?? "";
    if (body != null) {
      req.body = jsonEncode(body);
    }
    print(req.body);
    if (headers != null) req.headers.addAll(headers);
    req.encoding = encoding;
    req.followRedirects = followRedirects;
    req.maxRedirects = maxRedirects;
    req.persistentConnection = persistentConnection;

    return req.send().timeout(const Duration(seconds: 10), onTimeout: () {
      return http.StreamedResponse(const Stream.empty(), 0);
    });
  }
}

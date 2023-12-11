import 'dart:convert';

import 'package:bragi/common/services/global_variables.dart';
import 'package:bragi/common/services/user.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart';

class Authentication {
  String? token;
  User? user;

  Future<StreamedResponse> sendVerificationMail(String mail) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: "/send-verification-email",
      queryParameters: {
        'userEmail': mail,
      },
    );
    return res;
  }

  Future<StreamedResponse> verify(
      String code, String mail, String username, String password) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: '/verify',
      queryParameters: {
        'userCode': code,
        'mail': mail,
        'user': username,
        'pass': password,
      },
    );
    user = User(username: username);

    var result = await res.stream.bytesToString();
    token = json.decode(result)['token'];

    return res;
  }

  Future<StreamedResponse> register(
      String username, String password, String mail) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: '/register/username/$username/password/$password/email/$mail',
    );
    user = User(username: username);
    return res;
  }

  Future<StreamedResponse> login(String username, String password) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: "/login",
      queryParameters: {
        'name': username,
        'pass': password,
      },
    );
    user = User(username: username);

    var result = await res.stream.bytesToString();
    token = json.decode(result)['token'];

    return res;
  }

  Future<StreamedResponse> logout() async {
    if (user == null) return StreamedResponse(const Stream.empty(), 0);
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: "/logout",
      queryParameters: {
        'name': user?.username,
      },
    );
    return res;
  }

  Future<void> loginWithSpotify() async {
    var res = await GlobalVariables.client.send(
      method: 'GET',
      path: "/loginSpotify",
      followRedirects: false,
    );
    await FlutterWebAuth.authenticate(
        url: res.headers['location']!, callbackUrlScheme: 'bragi');
  }
}

String discernError(StreamedResponse response) {
  switch (response.statusCode) {
    case 0:
      return "Could not connect to server.";
    case 400:
      return "Bad request.";
    case 401:
      return "Wrong username or password.";
    case 403:
      return "Forbidden.";
    case 404:
      return "Not found.";
    case 500:
      return "Internal server error.";
    default:
      return "Unknown error.";
  }
}

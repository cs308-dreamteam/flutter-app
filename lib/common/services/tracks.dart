import 'dart:convert';

import 'package:bragi/common/services/client.dart' as custom_client;
import 'package:http/http.dart';

class Tracks {
  // Create a client
  var client = custom_client.Client();

  Future<List<dynamic>> getTracks(
      int limit, int offset, String? searchQuery) async {
    // Send a request to /tracks/getTracks
    // The response is a list json objects, each representing a track.
    StreamedResponse response = await client
        .send(method: 'GET', path: '/getAllSongs', queryParameters: {
      'limit': limit.toString(),
      'cursor': offset.toString(),
    });

    // Decode the response
    var decodedResponse = jsonDecode(await response.stream.bytesToString());

    return decodedResponse;
  }

  Future<List<Tracks>> getUserListens() async {
    StreamedResponse response =
        await client.send(method: 'GET', path: '/getLibrary');

    // Decode the response
    var decodedResponse = jsonDecode(await response.stream.bytesToString());

    return decodedResponse;
  }
}

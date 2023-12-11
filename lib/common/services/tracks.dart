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

  Future<List<dynamic>> getUserListens() async {
    StreamedResponse response =
        await client.send(method: 'GET', path: '/getFormattedLibrary');

    // Decode the response
    var decodedResponse = jsonDecode(await response.stream.bytesToString());

    return decodedResponse;
  }

  Future<List<dynamic>> getRecommendations() async {
    StreamedResponse response =
        await client.send(method: 'GET', path: '/getRecommendations');

    // Decode the response
    var decodedResponse = jsonDecode(await response.stream.bytesToString());
    var spotifyResponse = decodedResponse['spotifyRecom'];

    // process the spotify response
    List<dynamic> processedSpotifyResponse = [];
    for (var track in spotifyResponse) {
      var processedTrack = {
        'songTitle': track['song'],
        'artists': track['artist'].split(', '),
        'albums': track['album'].split(', '),
        'genres': track['genre'].split(', '),
      };
      processedSpotifyResponse.add(processedTrack);
    }
    return processedSpotifyResponse;
  }
}

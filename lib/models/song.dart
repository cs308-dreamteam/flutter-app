import 'dart:convert';

import 'package:bragi/common/services/global_variables.dart';
import 'package:bragi/song_library/widgets/details_entry.dart';
import 'package:bragi/song_library/widgets/song_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

import 'album.dart';
import 'artist.dart';

class Song {
  final String name;
  final List<Artist> artists;
  final List<Album> albums;
  int? rating;

  final Image? image;
  final double? danceability;
  final double? energy;
  final double? loudness;
  final double? mode;
  final double? speechiness;
  final double? acousticness;
  final double? instrumentalness;
  final double? liveness;
  final double? valence;
  final double? tempo;
  final String? type;
  final String? uri;
  final String? trackHref;
  final String? analysisUrl;
  final int? durationMs;
  final int? timeSignature;

  final int? popularity;
  final List<String>? genres;
  final DateTime? releaseYear;

  Song({
    this.image,
    this.rating,
    this.genres,
    this.danceability,
    this.energy,
    this.loudness,
    this.mode,
    this.speechiness,
    this.acousticness,
    this.instrumentalness,
    this.liveness,
    this.valence,
    this.tempo,
    this.type,
    this.uri,
    this.trackHref,
    this.analysisUrl,
    this.durationMs,
    this.timeSignature,
    this.releaseYear,
    this.popularity,
    required this.name,
    required this.artists,
    required this.albums,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    print(json);
    return Song(
      name: json['songTitle'],
      artists: json['artists']
          .map<Artist>((artist) => Artist(name: artist))
          .toList(),
      albums: json['albums'].map<Album>((album) => Album(name: album)).toList(),
      image: json['image'] != null
          ? Image.memory(base64Decode(json['image']))
          : null,
      genres: json['genres'].map<String>((genre) => genre.toString()).toList(),
      rating: json['rating'],
      danceability: json['features']?['danceability'],
      energy: json['features']?['energy'],
      loudness: json['loudness'],
      mode: json['mode'],
      speechiness: json['speechiness'],
      acousticness: json['acousticness'],
      instrumentalness: json['instrumentalness'],
      liveness: json['liveness'],
      valence: json['features']?['valence'],
      popularity: json['features']?['popularity'],
      tempo: json['tempo'],
      type: json['type'],
      uri: json['uri'],
      trackHref: json['track_href'],
      analysisUrl: json['analysis_url'],
      durationMs: json['duration_ms'],
      timeSignature: json['time_signature'],
      releaseYear: json['release_year'],
    );
  }

  static Song fromCsvRow(List<String> csvRow) {
    return Song(
      name: csvRow[0],
      artists: List<Artist>.empty(),
      albums: List<Album>.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': name,
      'artists': artists.map((artist) => artist.name).toList(),
      'albums': albums.map((album) => album.name).toList(),
      'image': image != null ? base64Encode(image!.toString().codeUnits) : null,
      'genres': genres,
      'rating': rating,
      'danceability': danceability,
      'energy': energy,
      'loudness': loudness,
      'mode': mode,
      'speechiness': speechiness,
      'acousticness': acousticness,
      'instrumentalness': instrumentalness,
      'liveness': liveness,
      'valence': valence,
      'tempo': tempo,
      'type': type,
      'uri': uri,
      'track_href': trackHref,
      'analysis_url': analysisUrl,
      'duration_ms': durationMs,
      'time_signature': timeSignature,
      'release_year': releaseYear,
    };
  }

  Widget asRowWidget(BuildContext context, {bool hasAddButton = false}) {
    return SongWidget(song: this, hasAddButton: hasAddButton);
  }

  static Song example() {
    return Song.fromJson({
      'song_title': "Electric Dreams",
      'artists': ["Synthwave Wizards"],
      'albums': ["Digital Odyssey"],
      'danceability': 0.85,
      'energy': 0.92,
      'loudness': -5.3,
      'mode': 1.0,
      'speechiness': 0.12,
      'acousticness': 0.08,
      'instrumentalness': 0.88,
      'liveness': 0.18,
      'valence': 0.78,
      'tempo': 120.0,
      'type': "audio_features",
      'uri': "spotify:track:4iV5W9uYEdYUVa79Axb7Rh",
      'track_href': "https://api.spotify.com/v1/tracks/4iV5W9uYEdYUVa79Axb7Rh",
      'analysis_url':
          "https://api.spotify.com/v1/audio-analysis/4iV5W9uYEdYUVa79Axb7Rh",
      'duration_ms': 267000,
      'time_signature': 4,
      'genres': ["Synthwave"],
      'release_year': DateTime(2021, 1, 1),
    });
  }

  Future<StreamedResponse> delete() async {
    StreamedResponse response = await GlobalVariables.client
        .send(method: 'DELETE', path: '/deleteSong', body: {'title': name});

    return response;
  }

  Future<StreamedResponse> add() async {
    rating ??= 0;
    StreamedResponse response = await GlobalVariables.client
        .send(method: 'POST', path: '/add_song', body: {
      'songList': [toJson()]
    });
    return response;
  }
}

class SongWidget extends StatefulWidget {
  final Song song;
  final bool hasAddButton;

  const SongWidget({Key? key, required this.song, this.hasAddButton = false})
      : super(key: key);

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  Widget details(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsEntry(
                  title: "Genres: ",
                  value: widget.song.genres?.join("\n") ?? "Unknown"),
              DetailsEntry(
                  title: "Danceability: ",
                  value: widget.song.danceability?.toString() ?? "Unknown"),
              DetailsEntry(
                  title: "Energy: ",
                  value: widget.song.energy?.toString() ?? "Unknown"),
              DetailsEntry(
                  title: "Valence: ",
                  value: widget.song.valence?.toString() ?? "Unknown"),
              DetailsEntry(
                  title: "Popularity: ",
                  value: widget.song.popularity?.toString() ?? "Unknown"),
              !widget.hasAddButton
                  ? SongDeleteButton(song: widget.song)
                  : Container(),
              widget.hasAddButton
                  ? TextButton(
                      onPressed: () async {
                        await widget.song.add();
                        if (!context.mounted) return;
                        context.pop();
                      },
                      child: const Text("Add"),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return details(context);
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: FittedBox(
                  child: widget.song.image == null
                      ? Icon(
                          Icons.music_note,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 64,
                        )
                      : widget.song.image!,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.song.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${widget.song.artists[0]} - ${widget.song.albums[0]}",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

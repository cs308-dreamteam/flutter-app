import 'album.dart';
import 'artist.dart';

class Song {
  final String name;
  final List<Artist> artists;
  final List<Album> albums;
  final double? rating;

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
  final double? durationMs;
  final double? timeSignature;
  final String? genre;
  final DateTime? releaseYear;

  Song({
    this.rating,
    this.genre,
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
    required this.name,
    required this.artists,
    required this.albums,
  });

  static Song fromJson(Map<String, dynamic> json) {
    return Song(
      name: json['name'],
      artists: json['artists'],
      albums: json['albums'],
      genre: json['genre'],
      rating: json['rating'],
      danceability: json['danceability'],
      energy: json['energy'],
      loudness: json['loudness'],
      mode: json['mode'],
      speechiness: json['speechiness'],
      acousticness: json['acousticness'],
      instrumentalness: json['instrumentalness'],
      liveness: json['liveness'],
      valence: json['valence'],
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
      'name': name,
      'artists': artists,
      'albums': albums,
      'genre': genre,
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
}

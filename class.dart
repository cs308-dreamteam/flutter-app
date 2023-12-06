import 'package:flutter/material.dart';

class Playlist {
  String name;
  List<Song> songs;
  String description;
  String imageUrl;

  Playlist({
    required this.name,
    required this.songs,
    required this.description,
    required this.imageUrl,
  });
}

class Song {
  String title;
  String artist;
  String imageUrl;

  Song({
    required this.title,
    required this.artist,
    required this.imageUrl,
  });
}





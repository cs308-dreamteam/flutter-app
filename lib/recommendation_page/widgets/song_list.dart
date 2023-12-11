import 'package:bragi/models/song.dart';
import 'package:flutter/material.dart';

import '../../common/services/tracks.dart';

class SongList extends StatefulWidget {
  const SongList({Key? key}) : super(key: key);
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  Tracks trackConnection = Tracks();
  List<Song> tracks = <Song>[];

  @override
  void initState() {
    super.initState();
    fetchTracks();
  }

  void fetchTracks() {
    trackConnection.getRecommendations().then((value) => {
          setState(() {
            tracks.addAll(value.map((e) => Song.fromJson(e)));
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return tracks[index].asRowWidget(context, hasAddButton: true);
      },
    );
  }
}

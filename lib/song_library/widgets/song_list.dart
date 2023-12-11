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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    fetchTracks();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          fetchTracks();
        }
      }
    });
  }

  void fetchTracks() {
    trackConnection.getTracks(30, tracks.length, null).then((value) => {
          setState(() {
            tracks.addAll(value.map((e) => Song.fromJson(e)));
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return tracks[index].asRowWidget(context);
      },
      controller: _scrollController,
    );
  }
}

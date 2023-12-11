import 'package:bragi/models/song.dart';
import 'package:flutter/material.dart';

import '../../common/services/tracks.dart';

class SongList extends StatefulWidget {
  final TextEditingController controller;
  const SongList({Key? key, required this.controller}) : super(key: key);
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  Tracks trackConnection = Tracks();
  List<Song> tracks = <Song>[];
  List<Song> currTracks = <Song>[];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    fetchTracks();

    widget.controller.addListener(() {
      setState(() {
        currTracks = tracks
            .where((element) => element.name
                .toLowerCase()
                .contains(widget.controller.text.toLowerCase()))
            .toList();
      });
    });

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
    trackConnection
        .getTracks(
          30,
          tracks.length,
          null,
        )
        .then((value) => {
              setState(() {
                tracks.addAll(value.map((e) => Song.fromJson(e)));
              }),
              filterTracks(),
            });
  }

  void filterTracks() {
    setState(() {
      currTracks = tracks
          .where((element) => element.name
              .toLowerCase()
              .contains(widget.controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currTracks.length,
      itemBuilder: (context, index) {
        return currTracks[index].asRowWidget(context, hasAddButton: true);
      },
      controller: _scrollController,
    );
  }
}

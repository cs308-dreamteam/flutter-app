import 'package:flutter/material.dart';

import '../../all_tracks/widgets/song_filter.dart';
import '../../all_tracks/widgets/song_list.dart';

class AllTracksScreen extends StatelessWidget {
  const AllTracksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SongFilter(
              controller: searchController,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SongList(
                  controller: searchController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

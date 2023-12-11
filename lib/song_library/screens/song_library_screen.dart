import 'package:bragi/home_page/widgets/navigation_button.dart';
import 'package:bragi/song_library/widgets/song_filter.dart';
import 'package:bragi/song_library/widgets/song_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SongLibraryScreen extends StatelessWidget {
  const SongLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.push('/upload');
          },
          label: const Text('Upload'),
          icon: const Icon(Icons.upload),
        ),
        body: Column(
          children: [
            NavigationButton(
                    tag: 'library',
                    text: "Song Library",
                    action: () => {},
                    icon: const Icon(Icons.filter_none))
                .buildTopBar(context),
            const SongFilter(),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SongList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

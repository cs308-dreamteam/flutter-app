import 'dart:convert';
import 'dart:io';

import 'package:bragi/common/widgets/or_separator.dart';
import 'package:bragi/common/widgets/simple_title.dart';
import 'package:bragi/song_upload/database_connection/database_connection_dialog.dart';
import 'package:bragi/song_upload/widgets/upload_option_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../models/song.dart';

class SongUploadScreen extends StatelessWidget {
  const SongUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            children: [
              const SimpleTitle(
                firstPart: "Song(s)",
                secondPart: "ADD",
                reverse: true,
              ),
              const SizedBox(height: 48),
              UploadOptionButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => context.push("/manualEntry"),
                text: "Manual Entry",
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const OrSeparator(),
              const SizedBox(height: 16),
              Text(
                "From",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              UploadOptionButton(
                onPressed: () async {
                  final songs = await loadFile();
                  print(songs);
                  // TODO:
                  // 1. Add songs to database
                },
                color: Theme.of(context).colorScheme.primary,
                text: "File",
                icon: Icon(
                  Icons.file_upload,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              UploadOptionButton(
                  onPressed: () => context.push("/allTracks"),
                  text: "All Tracks",
                  icon: Icon(
                    Icons.cloud_sync,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  color: Theme.of(context).colorScheme.primary),
              UploadOptionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => DatabaseConnectionDialog(),
                  );
                },
                color: Theme.of(context).colorScheme.primary,
                text: "Database",
                icon: Icon(
                  Icons.cloud,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              UploadOptionButton(
                onPressed: () => {},
                text: "Spotify",
                icon: SvgPicture.asset(
                  "assets/svg/spotify.svg",
                  semanticsLabel: 'Spotify Logo',
                ),
                color: const Color(0xFF1ED760),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Song>> loadFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'json',
        'csv',
      ],
    );
    List<Song> songs = [];
    if (result != null) {
      final path = result.files.single.path!;
      final text = await File(path).readAsString(); // encoding = utf-8
      if (path.endsWith(".json")) {
        // Convert string text to Map<String, dynamic>
        Map<String, dynamic> json = jsonDecode(text);
        for (var song in json['songs']) {
          songs.add(Song.fromJson(song));
        }
      } else if (path.endsWith(".csv")) {
        List<String> csv = const LineSplitter().convert(text);
        for (var row in csv.getRange(1, csv.length)) {
          songs.add(Song.fromCsvRow(row.split(",")));
        }
      } else {
        // A file was force loaded.
        throw Exception("Invalid file type");
      }
    }
    return songs;
  }
}

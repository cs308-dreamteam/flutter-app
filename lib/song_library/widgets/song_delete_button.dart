import 'package:flutter/material.dart';

import '../../models/song.dart';

class SongDeleteButton extends StatelessWidget {
  final Song song;
  const SongDeleteButton({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        song.delete(),
        Navigator.of(context).pop(),
      },
      child: Text("Delete"),
    );
  }
}

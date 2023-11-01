import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SongLibraryScreen extends StatelessWidget {
  const SongLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/upload');
        },
        label: Text('Upload'),
        icon: Icon(Icons.upload),
      ),
      body: Column(),
    );
  }
}

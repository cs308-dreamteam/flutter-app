import 'package:flutter/material.dart';

class SongFilter extends StatefulWidget {
  final TextEditingController controller;
  const SongFilter({Key? key, required this.controller}) : super(key: key);
  @override
  State<SongFilter> createState() => _SongFilterState();
}

class _SongFilterState extends State<SongFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search',
        ),
      ),
    );
  }
}

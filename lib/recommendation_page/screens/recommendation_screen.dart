import 'package:bragi/recommendation_page/widgets/song_list.dart';
import 'package:flutter/material.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SongList(),
        ),
      ),
    );
  }
}

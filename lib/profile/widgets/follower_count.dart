import 'package:flutter/material.dart';

class FollowerCount extends StatelessWidget {
  final int followerCount;
  const FollowerCount({Key? key, required this.followerCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          followerCount.toString(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(
          "Followers",
          style: TextStyle(
              height: 1, color: Theme.of(context).colorScheme.onPrimary),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.person_add_alt_1_outlined),
        label: const Text('Follow'),
      ),
    );
  }
}

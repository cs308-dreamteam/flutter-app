import 'package:bragi/profile/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

import '../../common/services/user.dart';
import 'follow_button.dart';
import 'follower_count.dart';

class ProfileHero extends StatelessWidget {
  final User user;
  const ProfileHero({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          Text(
            user.username,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ProfilePicture(image: user.image),
          const SizedBox(
            height: 30,
          ),
          const FollowButton(),
          const SizedBox(
            height: 30,
          ),
          FollowerCount(followerCount: user.followers),
        ],
      ),
    );
  }
}

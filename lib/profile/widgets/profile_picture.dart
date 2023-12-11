import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final Image? image;
  const ProfilePicture({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(10),
        child: image ??
            const Icon(
              Icons.person,
              size: 100,
            ),
      ),
    );
  }
}

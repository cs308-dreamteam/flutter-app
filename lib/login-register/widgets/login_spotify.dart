import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginSpotify extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const LoginSpotify(
      {Key? key, required this.onPressed, this.text = "Sign up using Spotify"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1ED760),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/svg/spotify.svg",
              semanticsLabel: 'Spotify Logo',
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginSpotify extends StatelessWidget {
  const LoginSpotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xFF1ED760),
            ),
          ),
      onPressed: () => {},
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
              "Sign up using Spotify",
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

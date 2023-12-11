import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LandingScrollText extends StatelessWidget {
  const LandingScrollText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textDuration = const Duration(milliseconds: 80);

    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 64.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: FittedBox(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 1,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            isRepeatingAnimation: true,
            animatedTexts: [
              TyperAnimatedText(
                "Discover",
                speed: textDuration,
              ),
              TyperAnimatedText(
                "Share",
                speed: textDuration,
              ),
              TyperAnimatedText(
                "Create",
                speed: textDuration,
              ),
              TyperAnimatedText(
                "Enhance",
                speed: textDuration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

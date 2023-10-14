import 'package:flutter/material.dart';

class LoginServiceSwitch extends StatelessWidget {
  // Widget for the Login/Register switcher
  final String firstText;
  final String secondText;
  const LoginServiceSwitch(
      {Key? key, required this.firstText, required this.secondText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          children: [
            TextSpan(
              text: firstText,
            ),
            TextSpan(
              text: secondText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

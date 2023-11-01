import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  const LoginButton({Key? key, required this.onPress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}

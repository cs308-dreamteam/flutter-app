import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void onPress;
  final String text;
  const LoginButton({Key? key, this.onPress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            padding: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
            ).padding,
          ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingButton extends StatelessWidget {
  const LandingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        context.push('/register'),
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Text(
        "Get Started",
        style: TextStyle(
          fontSize: 28.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

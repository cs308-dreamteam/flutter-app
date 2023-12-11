import 'package:bragi/landing/widgets/landing_button.dart';
import 'package:bragi/landing/widgets/landing_scroll_text.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LandingScrollText(),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 48.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Column(
                        children: [
                          Text("Your Own"),
                          Text("Music Taste"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const LandingButton(),
            ],
          ),
        ),
      ),
    );
  }
}

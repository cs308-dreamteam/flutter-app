import 'package:flutter/material.dart';

class ModalTitle extends StatelessWidget {
  final String text;
  const ModalTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

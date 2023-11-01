import 'package:flutter/material.dart';

class ModalDescription extends StatelessWidget {
  final String text;
  const ModalDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );
  }
}

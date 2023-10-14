import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final String fieldLabel;
  final String fieldHint;
  final TextEditingController controller;
  const LoginField(
      {Key? key,
      required this.fieldLabel,
      required this.fieldHint,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          label: Text(fieldLabel),
          border: const OutlineInputBorder(),
          hintText: fieldHint,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginField extends StatefulWidget {
  final String fieldLabel;
  final String fieldHint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const LoginField({
    Key? key,
    required this.fieldLabel,
    required this.fieldHint,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  final FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        validator: widget.validator,
        focusNode: _focus,
        controller: widget.controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorMaxLines: 2,
          label: Text(widget.fieldLabel),
          border: const OutlineInputBorder(),
          hintText: widget.fieldHint,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

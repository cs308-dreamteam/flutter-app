import 'package:flutter/material.dart';

class SimpleTextField extends StatefulWidget {
  final String fieldLabel;
  final String fieldHint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double width;
  const SimpleTextField({
    Key? key,
    this.width = 250,
    required this.fieldLabel,
    required this.fieldHint,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<SimpleTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  final FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
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

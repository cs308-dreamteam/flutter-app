import 'package:bragi/common/widgets/simple_text_field.dart';
import 'package:flutter/material.dart';

class AdditiveTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const AdditiveTextField(
      {Key? key, required this.label, required this.controller})
      : super(key: key);

  @override
  State<AdditiveTextField> createState() => _AdditiveTextFieldState();
}

class _AdditiveTextFieldState extends State<AdditiveTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60,
          child: SimpleTextField(
            fieldLabel: widget.label,
            fieldHint: widget.label,
            controller: widget.controller,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 60,
          height: 60,
          child: ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.all(0),
            ),
            child: Text(
              "+",
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

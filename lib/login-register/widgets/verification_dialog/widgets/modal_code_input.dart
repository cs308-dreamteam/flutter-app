import 'package:flutter/material.dart';

class ModalCodeInput extends StatelessWidget {
  ModalCodeInput({super.key});
  final List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 16,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (int i = 0; i < controllers.length; i++)
          ModalCodeInputDigit(controller: controllers[i]),
      ],
    );
  }
}

class ModalCodeInputDigit extends StatefulWidget {
  final TextEditingController controller;
  const ModalCodeInputDigit({super.key, required this.controller});

  @override
  State<ModalCodeInputDigit> createState() => _ModalCodeInputDigitState();
}

class _ModalCodeInputDigitState extends State<ModalCodeInputDigit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // These values come from figma,
      // which had the container height/width set to 300 and digits to 80/50
      width: MediaQuery.of(context).size.width / 6,
      height: MediaQuery.of(context).size.width * 4 / 15,
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w300,
        ),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counter: const Offstage(),
          focusColor: Theme.of(context).colorScheme.secondaryContainer,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        expands: true,
        maxLines: null,
        maxLength: 1,
        onChanged: (String text) => {
          if (text.isNotEmpty)
            {
              FocusScope.of(context).nextFocus(),
            }
        },
      ),
    );
  }
}

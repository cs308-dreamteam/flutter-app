import 'package:flutter/material.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 1,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
        ),
        const Text(
          "OR",
        ),
        Container(
          width: 100,
          height: 1,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
        ),
      ],
    );
  }
}

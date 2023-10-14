import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  final String firstPart;
  final String secondPart;
  const LoginTitle(
      {Key? key, required this.firstPart, required this.secondPart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: -30,
      children: <Widget>[
        Text(
          firstPart,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 48,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        Text(
          secondPart,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 72,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}

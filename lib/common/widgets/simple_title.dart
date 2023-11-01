import 'package:flutter/material.dart';

class SimpleTitle extends StatelessWidget {
  final String firstPart;
  final String secondPart;
  final bool reverse;
  const SimpleTitle(
      {Key? key,
      required this.firstPart,
      required this.secondPart,
      this.reverse = false})
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
      ].reverseIf(reverse),
    );
  }
}

extension ReverseIf on List<Widget> {
  List<Widget> reverseIf([bool condition = true]) {
    if (condition) {
      return reversed.toList();
    }
    return this;
  }
}

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  const Logo({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/svg/logo.png",
      width: width,
      fit: BoxFit.fitWidth,
    );
  }
}

import 'package:bragi/common/services/global_variables.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome, ${GlobalVariables.authentication.user?.username}",
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

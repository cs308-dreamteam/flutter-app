import 'package:bragi/login-register/widgets/login_button.dart';
import 'package:bragi/login-register/widgets/login_service_switch.dart';
import 'package:bragi/login-register/widgets/login_spotify.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/logo.dart';
import '../widgets/login_field.dart';
import '../widgets/login_separator.dart';
import '../widgets/login_title.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  const Logo(
                    width: 200,
                  ),
                  const LoginTitle(
                    firstPart: "Sign",
                    secondPart: "In",
                  ),
                  LoginField(
                    fieldLabel: "Email",
                    fieldHint: "Email",
                    controller: emailController,
                  ),
                  LoginField(
                    fieldLabel: "Password",
                    fieldHint: "Password",
                    controller: passwordController,
                  ),
                  const LoginButton(text: "Sign In"),
                  const LoginSeparator(),
                  const LoginSpotify(),
                ],
              ),
            ),
          ),
          const LoginServiceSwitch(
            firstText: "Don't have an account?",
            secondText: "Sign Up",
          ),
        ],
      ),
    );
  }
}

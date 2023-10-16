import 'package:bragi/common/services/global_variables.dart';
import 'package:bragi/login-register/widgets/login_button.dart';
import 'package:bragi/login-register/widgets/login_service_switch.dart';
import 'package:bragi/login-register/widgets/login_spotify.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/logo.dart';
import '../widgets/login_field.dart';
import '../widgets/login_separator.dart';
import '../widgets/login_title.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
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
                        secondPart: "Up",
                      ),
                      LoginField(
                        fieldLabel: "Email",
                        fieldHint: "Email",
                        controller: emailController,
                      ),
                      LoginField(
                        fieldLabel: "Username",
                        fieldHint: "Username",
                        controller: usernameController,
                      ),
                      LoginField(
                        fieldLabel: "Password",
                        fieldHint: "Password",
                        controller: passwordController,
                      ),
                      LoginButton(
                        // TODO: Add field verifications
                        text: "Sign Up",
                        onPress: pressedRegister(emailController.text),
                      ),
                      const LoginSeparator(),
                      const LoginSpotify(),
                    ],
                  ),
                ),
              ),
              const LoginServiceSwitch(
                firstText: "Already have an account?\n",
                secondText: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pressedRegister(String mail) async {
    GlobalVariables.authentication.sendVerificationMail(mail);
  }
}

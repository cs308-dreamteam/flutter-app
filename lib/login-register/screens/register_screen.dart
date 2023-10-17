import 'package:bragi/login-register/services/validators.dart';
import 'package:bragi/login-register/widgets/login_button.dart';
import 'package:bragi/login-register/widgets/login_service_switch.dart';
import 'package:bragi/login-register/widgets/login_spotify.dart';
import 'package:bragi/login-register/widgets/verification_dialog/verification_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/services/global_variables.dart';
import '../../common/widgets/logo.dart';
import '../widgets/login_field.dart';
import '../widgets/login_separator.dart';
import '../widgets/login_title.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      Logo(
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      const LoginTitle(
                        firstPart: "Sign",
                        secondPart: "Up",
                      ),
                      Form(
                        key: _formKey,
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 16,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            LoginField(
                              fieldLabel: "Email",
                              fieldHint: "Email",
                              controller: emailController,
                              validator: (String? value) {
                                if (!Validator.isEmailValid(value)) {
                                  return "Please enter a valid email.";
                                }
                                return null;
                              },
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
                              validator: (String? value) {
                                if (!Validator.isPasswordValid(value)) {
                                  return "Password must contain at least 8 characters.";
                                }
                                return null;
                              },
                            ),
                            LoginButton(
                              text: "Sign Up",
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  GlobalVariables.authentication
                                      .sendVerificationMail(
                                          emailController.text);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        VerificationModal(
                                      mail: emailController.text,
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const LoginSeparator(),
                      const LoginSpotify(),
                    ],
                  ),
                ),
              ),
              LoginServiceSwitch(
                firstText: "Already have an account?\n",
                secondText: "Sign In",
                onPressed: () => context.go("/login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

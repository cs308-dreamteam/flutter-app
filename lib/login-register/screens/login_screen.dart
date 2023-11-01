import 'package:bragi/login-register/widgets/login_button.dart';
import 'package:bragi/login-register/widgets/login_service_switch.dart';
import 'package:bragi/login-register/widgets/login_spotify.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/services/global_variables.dart';
import '../../common/widgets/logo.dart';
import '../services/validators.dart';
import '../widgets/login_field.dart';
import '../widgets/login_separator.dart';
import '../widgets/login_title.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

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
                        secondPart: "In",
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
                              text: "Sign In",
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  var statusCode = await GlobalVariables
                                      .authentication
                                      .login(usernameController.text,
                                          passwordController.text);
                                  if (!context.mounted) return;
                                  if (statusCode == 201) {
                                    context.go("/profile");
                                  }
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
                firstText: "Don't have an account?\n",
                secondText: "Sign Up",
                onPressed: () => context.go("/register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

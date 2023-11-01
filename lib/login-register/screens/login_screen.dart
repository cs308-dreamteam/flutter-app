import 'package:bragi/common/widgets/or_separator.dart';
import 'package:bragi/login-register/widgets/login_button.dart';
import 'package:bragi/login-register/widgets/login_service_switch.dart';
import 'package:bragi/login-register/widgets/login_spotify.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/services/global_variables.dart';
import '../../common/services/validators.dart';
import '../../common/widgets/logo.dart';
import '../../common/widgets/simple_text_field.dart';
import '../../common/widgets/simple_title.dart';

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
                      const SimpleTitle(
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
                            SimpleTextField(
                              fieldLabel: "Username",
                              fieldHint: "Username",
                              controller: usernameController,
                            ),
                            SimpleTextField(
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
                      const OrSeparator(),
                      LoginSpotify(
                        onPressed: () async {
                          await GlobalVariables.authentication
                              .loginWithSpotify();
                        },
                      ),
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

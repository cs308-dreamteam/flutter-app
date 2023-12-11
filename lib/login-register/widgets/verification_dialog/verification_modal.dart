import 'package:bragi/common/services/global_variables.dart';
import 'package:bragi/login-register/widgets/verification_dialog/widgets/modal_code_input.dart';
import 'package:bragi/login-register/widgets/verification_dialog/widgets/modal_description.dart';
import 'package:bragi/login-register/widgets/verification_dialog/widgets/modal_resend_code_button.dart';
import 'package:bragi/login-register/widgets/verification_dialog/widgets/modal_title.dart';
import 'package:bragi/login-register/widgets/verification_dialog/widgets/modal_verify_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class VerificationModal extends StatelessWidget {
  final String mail;
  final String username;
  final String password;
  final input = ModalCodeInput();
  VerificationModal({
    Key? key,
    required this.mail,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondaryContainer,
          width: 5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FittedBox(
              child: ModalTitle(
                text: "Verify your email address",
              ),
            ),
            FittedBox(
              child: ModalDescription(
                text: "A verification email has been sent to\n$mail",
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ModalResendCodeButton(
              // TODO: add cooldown timer
              onPressed: () =>
                  GlobalVariables.authentication.sendVerificationMail(mail),
            ),
            const SizedBox(
              height: 32,
            ),
            input,
            const SizedBox(
              height: 16,
            ),
            ModalVerifyButton(
              onPressed: () async {
                StreamedResponse statusCode =
                    await GlobalVariables.authentication.verify(
                  input.controllers.map((e) => e.text).join(""),
                  mail,
                  username,
                  password,
                );
                // TODO: Add error handling
                if (!context.mounted) return;
                if (statusCode.statusCode == 201) {
                  context.push("/homePage");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

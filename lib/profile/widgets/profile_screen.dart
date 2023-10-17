import 'package:bragi/common/services/global_variables.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GlobalVariables.authentication.logout();
          },
          child: const Text("a"),
        ),
      ),
    );
  }
}

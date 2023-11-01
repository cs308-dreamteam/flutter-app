import 'package:flutter/material.dart';

class LoginSeparator extends StatelessWidget {
  const LoginSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 1,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
        ),
        Text("OR"),
        Container(
          width: 100,
          height: 1,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
        ),
      ],
    );
  }
}

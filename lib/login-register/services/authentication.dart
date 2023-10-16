import 'package:bragi/common/services/global_variables.dart';
import 'package:bragi/login-register/services/user.dart';

class Authentication {
  String? token;
  User? user;

  Future<int> sendVerificationMail(String mail) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: "/send-verification-email",
      queryParameters: {
        'userEmail': mail,
      },
    );
    return res.statusCode;
  }

  Future<int> verify(
      int code, String mail, String username, String password) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: '/verify',
      queryParameters: {
        'userCode': code,
        'mail': mail,
        'user': username,
        'pass': password,
      },
    );
    return res.statusCode;
  }
}

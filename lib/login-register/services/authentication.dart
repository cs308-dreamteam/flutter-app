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
      String code, String mail, String username, String password) async {
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

  Future<int> register(String username, String password, String mail) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: '/register/username/$username/password/$password/email/$mail',
    );
    user = User(username: username);
    return res.statusCode;
  }

  Future<int> login(String username, String password) async {
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: "/login",
      queryParameters: {
        'name': username,
        'pass': password,
      },
    );
    user = User(username: username);
    return res.statusCode;
  }

  Future<int> logout() async {
    if (user == null) return 0;
    var res = await GlobalVariables.client.send(
      method: 'POST',
      path: "/logout",
      queryParameters: {
        'name': user?.username,
      },
    );
    return res.statusCode;
  }
}

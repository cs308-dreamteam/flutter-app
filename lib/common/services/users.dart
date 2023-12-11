import 'dart:convert';

import 'package:bragi/common/services/global_variables.dart';
import 'package:bragi/common/services/user.dart';
import 'package:http/http.dart';

class Users {
  static Future<List<String>> getUsernames() async {
    StreamedResponse response = await GlobalVariables.client.send(
      method: 'GET',
      path: '/get_usernames',
    );
    String responseString = await response.stream.bytesToString();
    List<String> usernames = jsonDecode(responseString).cast<String>();
    return usernames;
  }

  static Future<User> getUser(String username) async {
    StreamedResponse response = await GlobalVariables.client.send(
      method: 'GET',
      path: '/get_user/$username',
    );
    String responseString = await response.stream.bytesToString();
    Map<String, dynamic> userMap = jsonDecode(responseString);
    User user = User.fromJson(userMap);
    return user;
  }
}

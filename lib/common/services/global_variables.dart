import 'package:bragi/common/services/client.dart';
import 'package:bragi/login-register/services/authentication.dart';

class GlobalVariables {
  static Authentication authentication = Authentication();
  static Client client = Client();
}

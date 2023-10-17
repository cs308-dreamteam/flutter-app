class Validator {
  static bool isEmailValid(String? text) {
    if (text == null) return false;
    RegExp reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return reg.hasMatch(text);
  }

  static bool isPasswordValid(String? text) {
    if (text == null) return false;
    /*
    ^                         Start anchor
    .{8}                      Ensure string is of length 8.
    $                         End anchor.
     */
    RegExp reg = RegExp(r'^.{8,}$');
    return reg.hasMatch(text);
  }
}

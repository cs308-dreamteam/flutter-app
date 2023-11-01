class Validator {
  static bool isEmailValid(String? text) {
    if (text == null || text.isEmpty) return false;
    RegExp reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return reg.hasMatch(text);
  }

  static bool isPasswordValid(String? text) {
    if (text == null || text.isEmpty) return false;
    /*
    ^                         Start anchor
    .{8}                      Ensure string is of length 8.
    $                         End anchor.
     */
    RegExp reg = RegExp(r'^.{8,}$');
    return reg.hasMatch(text);
  }

  static bool isIPAddressValid(String? text) {
    if (text == null || text.isEmpty) return false;
    RegExp reg = RegExp(r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}$');
    return reg.hasMatch(text);
  }

  static bool isPortValid(String? text) {
    if (text == null || text.isEmpty) return false;
    RegExp reg = RegExp(r'^[0-9]{1,5}$');
    return reg.hasMatch(text);
  }
}

class ValidationFunctions {
  /// EMAIL VALIDATOR
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Not a valid email address. Should be your@email.com';
    }
    return null;
  }
}
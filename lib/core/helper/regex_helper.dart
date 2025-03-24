class RegexHelper {
  static final RegExp _emailRegExp =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  static bool isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}

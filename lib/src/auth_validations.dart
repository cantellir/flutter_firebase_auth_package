class AuthValidations {
  static bool isLoginEmailAndPasswordFilled(String email, String password) {
    return (email.isNotEmpty && password.isNotEmpty);
  }

  static bool isRegisterEmailFilled(String email) {
    return (email.isNotEmpty);
  }

  static bool isRegisterPasswordFilled(String password) {
    return (password.isNotEmpty);
  }

  static bool isPasswordEqualConfirmation(
      String password, String passwordConfirmation) {
    return (password == passwordConfirmation);
  }

  static bool isRecoverEmailFilled(String email) {
    return (email.isNotEmpty);
  }
}

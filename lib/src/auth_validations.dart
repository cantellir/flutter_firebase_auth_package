class AuthValidations {
  static bool isLoginEmailAndPasswordFilled(String email, String password) {
    return (email.isNotEmpty && password.isNotEmpty);
  }

  static bool isRegisterAllFieldsFilled(
      String name, String email, String password, String passwordConfirmation) {
    return (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        passwordConfirmation.isNotEmpty);
  }

  static bool isPasswordEqualConfirmation(
      String password, String passwordConfirmation) {
    return (password == passwordConfirmation);
  }

  static bool isRecoverEmailFilled(String email) {
    return (email.isNotEmpty);
  }
}

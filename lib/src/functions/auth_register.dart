import 'package:firebase_auth_package/src/service/auth_service.dart';
import 'package:firebase_auth_package/src/auth_validations.dart';
import 'package:firebase_auth_package/src/exception/auth_exception.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_errors.dart';

class AuthRegister {
  final AuthService authService;

  AuthRegister(this.authService);

  Future<void> register(String name, String email, String password,
      String passwordConfirmation) async {
    if (!AuthValidations.isRegisterAllFieldsFilled(
        name, email, password, passwordConfirmation)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_FIELDS);
    }

    if (!AuthValidations.isPasswordEqualConfirmation(
        password, passwordConfirmation)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_PASSWORD_CONFIRMATION);
    }

    return await authService.register(email, password).catchError((error) {
      AuthException.throwException(error.toString());
    });
  }
}

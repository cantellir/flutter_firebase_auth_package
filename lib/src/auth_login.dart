import 'package:firebase_auth_package/src/auth_service.dart';
import 'package:firebase_auth_package/src/auth_validations.dart';
import 'package:firebase_auth_package/src/exception/auth_exception.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_errors.dart';

class AuthLogin {
  final AuthService authService;

  AuthLogin(this.authService);

  Future<void> login(String email, String password) async {
    if (!AuthValidations.isLoginEmailAndPasswordFilled(email, password)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL_PASSWORD);
    }

    return await authService.login(email, password).catchError((error) {
      AuthException.throwException(error.toString());
    });
  }
}

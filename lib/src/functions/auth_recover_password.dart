import 'package:firebase_auth_package/src/service/auth_service.dart';
import 'package:firebase_auth_package/src/auth_validations.dart';
import 'package:firebase_auth_package/src/exception/auth_exception.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_errors.dart';

class AuthRecoverPassword {
  final AuthService authService;

  AuthRecoverPassword(this.authService);

  Future<void> recoverPassword(String email) async {
    if (!AuthValidations.isRecoverEmailFilled(email)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL);
    }

    await authService.recoverPassword(email).catchError((error) {
      AuthException.throwException(error.toString());
    });
  }
}

import 'package:firebase_auth_package/src/auth_validations.dart';
import 'package:firebase_auth_package/src/exception/auth_exception.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_errors.dart';
import 'package:firebase_auth_package/src/service/auth_service.dart';
import 'package:firebase_auth_package/src/service/auth_service_firestore.dart';

class AuthFunctions {
  AuthService _authService;
  AuthFunctions({AuthService authService}) {
    this._authService = authService ?? AuthServiceFirestore();
  }

  Future<void> login(String email, String password) async {
    if (!AuthValidations.isLoginEmailAndPasswordFilled(email, password)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL_PASSWORD);
    }

    return await _authService.login(email, password).catchError((error) async {
      AuthException.throwException(error.toString());
    });
  }

  Future<void> loginByGoogle() async {
    return await _authService.loginByGoogle().catchError((error) {
      AuthException.throwException(error.toString());
    });
  }

  Future<void> loginByFacebook() async {
    return await _authService.loginByFacebook().catchError((error) {
      AuthException.throwException(error.toString());
    });
  }

  Future<void> register(
      String email, String password, String passwordConfirmation) async {
    if (!AuthValidations.isRegisterEmailFilled(email)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL);
    }

    if (!AuthValidations.isRegisterPasswordFilled(password)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_PASSWORD);
    }

    if (!AuthValidations.isPasswordEqualConfirmation(
        password, passwordConfirmation)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_PASSWORD_CONFIRMATION);
    }

    return await _authService.register(email, password).catchError((error) {
      AuthException.throwException(error.toString());
    });
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  Future<void> recoverPassword(String email) async {
    if (!AuthValidations.isRecoverEmailFilled(email)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL);
    }

    await _authService.recoverPassword(email).catchError((error) {
      AuthException.throwException(error.toString());
    });
  }
}

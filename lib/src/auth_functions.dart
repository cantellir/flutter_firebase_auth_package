import 'package:firebase_auth_package/src/auth_validations.dart';
import 'package:firebase_auth_package/src/exception/auth_exception.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_errors.dart';
import 'package:firebase_auth_package/src/repository/auth_repository.dart';
import 'package:firebase_auth_package/src/repository/firebase_auth_repository.dart';

class AuthFunctions {
  AuthRepository _authRepository;

  AuthFunctions({AuthRepository authRepository})
      : _authRepository = authRepository ?? FirebaseAuthRepository();

  Future<void> login(String email, String password) async {
    if (!AuthValidations.isLoginEmailAndPasswordFilled(email, password)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL_PASSWORD);
    }

    return await _authRepository.login(email, password).catchError((error) async {
      AuthException.throwException(error.toString());
    });
  }

  Future<void> loginByGoogle() async {
    return await _authRepository.loginByGoogle().catchError((error) {
      AuthException.throwException(error.toString());
    });
  }

  Future<void> loginByFacebook() async {
    return await _authRepository.loginByFacebook().catchError((error) {
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

    return await _authRepository.register(email, password).catchError((error) {
      AuthException.throwException(error.toString());
    });
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }

  Future<void> recoverPassword(String email) async {
    if (!AuthValidations.isRecoverEmailFilled(email)) {
      AuthException.throwException(
          AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL);
    }

    await _authRepository.recoverPassword(email).catchError((error) {
      AuthException.throwException(error.toString());
    });
  }
}

import 'package:firebase_auth_package/firebase_auth_package.dart';
import 'package:firebase_auth_package/src/service/auth_service.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_errors.dart';

class AuthServiceMock extends AuthService {
  String validEmail = 'validemail@test.com';
  String validPassword = 'validpassword';
  String invalidEmail = 'invalidemail@test.com';
  String invalidPassword = 'invalidpassword';
  String weakPassword = '12345';
  String notFountEmail = 'notfound@test.com';
  String registeredEmail = 'registered@test.com';
  String invalidCredentialEmail = 'invalidcredential@test.com';

  String validName = 'Peter Park';

  @override
  Future<void> login(String email, String password) async {
    if (email == validEmail && password == validPassword) {
      return;
    }

    if (email == invalidEmail) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_INVALID_EMAIL);
    }

    if (password == invalidPassword) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_WRONG_PASSWORD);
    }

    if (email == notFountEmail) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_USER_NOT_FOUND);
    }

    return;
  }

  @override
  Future<void> logout() {
    return null;
  }

  @override
  Future<void> recoverPassword(String email) async {
    if (email == validEmail) {
      return;
    }

    if (email == invalidEmail) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_INVALID_EMAIL);
    }

    if (email == notFountEmail) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_USER_NOT_FOUND);
    }

    return;
  }

  @override
  Future<void> register(String email, String password) async {
    if (email == validEmail && password == validPassword) {
      return;
    }

    if (email == invalidEmail) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_INVALID_EMAIL);
    }

    if (password.length < 6) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_WEAK_PASSWORD);
    }

    if (email == registeredEmail) {
      throw Exception(AuthExceptionErrors.FIREBASE_ERROR_EMAIL_ALREADY_IN_USE);
    }

    return;
  }

  @override
  Future<void> loginByGoogle() {
    return null;
  }

  @override
  Future<void> loginByFacebook() {
    return null;
  }
}

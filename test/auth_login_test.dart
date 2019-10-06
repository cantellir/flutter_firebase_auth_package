import 'package:firebase_auth_package/src/auth_login.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_messages.dart';
import 'package:flutter_test/flutter_test.dart';

import 'auth_service_mock.dart';

void main() {
  AuthLogin _authLogin;
  AuthServiceMock _authServiceMock;

  setUp(() {
    _authServiceMock = AuthServiceMock();
    _authLogin = AuthLogin(_authServiceMock);
  });

  group('Internal tests - before call firebase functions', () {
    test('Login should fail with blank e-mail and password', () {
      expect(
          _authLogin.login('', ''),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_EMAIL_PASSWORD)));
    });

    test('Login should fail with blank e-mail', () {
      expect(
          _authLogin.login('', _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_EMAIL_PASSWORD)));
    });

    test('Login should fail with blank password', () {
      expect(
          _authLogin.login(_authServiceMock.validEmail, ''),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_EMAIL_PASSWORD)));
    });
  });

  group('External/firebase tests', () {
    test('Login should fail with invalid firebase email', () {
      expect(
          _authLogin.login(
              _authServiceMock.invalidEmail, _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_INVALID_EMAIL)));
    });

    test('Login should fail with invalid firebase password', () {
      expect(
          _authLogin.login(
              _authServiceMock.validEmail, _authServiceMock.invalidPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_WRONG_PASSWORD)));
    });

    test('Login should fail with user not found in firebase', () {
      expect(
          _authLogin.login(
              _authServiceMock.notFountEmail, _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_USER_NOT_FOUND)));
    });
  });
}

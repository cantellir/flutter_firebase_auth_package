import 'package:firebase_auth_package/src/functions/auth_recover_password.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_messages.dart';
import 'package:flutter_test/flutter_test.dart';

import 'auth_service_mock.dart';

void main() {
  AuthRecoverPassword _authRecoverPassword;
  AuthServiceMock _authServiceMock;

  setUp(() {
    _authServiceMock = AuthServiceMock();
    _authRecoverPassword = AuthRecoverPassword(_authServiceMock);
  });

  group('Internal tests - before call firebase functions', () {
    test('Recover should fail with blank e-mail', () {
      expect(
          _authRecoverPassword.recoverPassword(''),
          throwsA(predicate(
              (e) => e.message == AuthExceptionMessages.MESSAGE_BLANK_EMAIL)));
    });
  });

  group('External/firebase tests', () {
    test('Recover should fail with invalid firebase email', () {
      expect(
          _authRecoverPassword.recoverPassword(_authServiceMock.invalidEmail),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_INVALID_EMAIL)));
    });

    test('Recover should fail with not found firebase email', () {
      expect(
          _authRecoverPassword.recoverPassword(_authServiceMock.notFountEmail),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_USER_NOT_FOUND)));
    });
  });
}

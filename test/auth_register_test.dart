import 'package:firebase_auth_package/firebase_auth_package.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_messages.dart';
import 'package:flutter_test/flutter_test.dart';

import 'auth_service_mock.dart';

void main() {
  AuthFunctions _authFunctions;
  AuthServiceMock _authServiceMock;

  setUp(() {
    _authServiceMock = AuthServiceMock();
    _authFunctions = AuthFunctions(authService: _authServiceMock);
  });

  group('Internal tests - before call firebase functions', () {
    test('Register should fail with blank email', () {
      expect(
          _authFunctions.register('', _authServiceMock.validPassword,
              _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_EMAIL)));
    });

    test('Register should fail with blank password', () {
      expect(
          _authFunctions.register(
              _authServiceMock.validEmail, '', _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_PASSWORD)));
    });

    test(
        'Register should fail if password and password confirmation are not equals',
        () {
      expect(
          _authFunctions.register(_authServiceMock.validEmail,
              _authServiceMock.validPassword, _authServiceMock.invalidPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_PASSWORD_CONFIRMATION)));
    });
  });

  group('External/firebase tests', () {
    test('Register should fail with invalid firebase email', () {
      expect(
          _authFunctions.register(_authServiceMock.invalidEmail,
              _authServiceMock.validPassword, _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_INVALID_EMAIL)));
    });

    test('Register should fail if password is less than 6 characters', () {
      expect(
          _authFunctions.register(_authServiceMock.validEmail,
              _authServiceMock.weakPassword, _authServiceMock.weakPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_WEAK_PASSWORD)));
    });

    test('Register should fail if email already exists', () {
      expect(
          _authFunctions.register(_authServiceMock.registeredEmail,
              _authServiceMock.validPassword, _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_EMAIL_ALREADY_IN_USE)));
    });
  });
}

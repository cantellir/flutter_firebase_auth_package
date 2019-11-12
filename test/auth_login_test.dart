
import 'package:firebase_auth_package/src/auth_functions.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_messages.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_auth_repository.dart';

void main() {
  AuthFunctions _authFunctions;
  MockAuthRepository _mockAuthRepository;

  setUp(() {
    _mockAuthRepository = MockAuthRepository();
    _authFunctions = AuthFunctions(authRepository: _mockAuthRepository);
  });

  group('Internal tests - before call firebase functions', () {
    test('Login should fail with blank e-mail and password', () {
      expect(
          _authFunctions.login('', ''),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_EMAIL_PASSWORD)));
    });

    test('Login should fail with blank e-mail', () {
      expect(
          _authFunctions.login('', _mockAuthRepository.validPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_EMAIL_PASSWORD)));
    });

    test('Login should fail with blank password', () {
      expect(
          _authFunctions.login(_mockAuthRepository.validEmail, ''),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_BLANK_EMAIL_PASSWORD)));
    });
  });

  group('External/firebase tests', () {
    test('Login should fail with invalid firebase email', () {
      expect(
          _authFunctions.login(
              _mockAuthRepository.invalidEmail, _mockAuthRepository.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_INVALID_EMAIL)));
    });

    test('Login should fail with invalid firebase password', () {
      expect(
          _authFunctions.login(
              _mockAuthRepository.validEmail, _mockAuthRepository.invalidPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_WRONG_PASSWORD)));
    });

    test('Login should fail with user not found in firebase', () {
      expect(
          _authFunctions.login(
              _mockAuthRepository.notFountEmail, _mockAuthRepository.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_USER_NOT_FOUND)));
    });
  });
}

import 'package:firebase_auth_package/firebase_auth_package.dart';
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
    test('Register should fail with blank email', () {
      expect(
          _authFunctions.register('', _mockAuthRepository.validPassword,
              _mockAuthRepository.validPassword),
          throwsA(predicate(
              (e) => e.message == AuthExceptionMessages.MESSAGE_BLANK_EMAIL)));
    });

    test('Register should fail with blank password', () {
      expect(
          _authFunctions.register(
              _mockAuthRepository.validEmail, '', _mockAuthRepository.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_BLANK_PASSWORD)));
    });

    test(
        'Register should fail if password and password confirmation are not equals',
        () {
      expect(
          _authFunctions.register(_mockAuthRepository.validEmail,
              _mockAuthRepository.validPassword, _mockAuthRepository.invalidPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_PASSWORD_CONFIRMATION)));
    });
  });

  group('External/firebase tests', () {
    test('Register should fail with invalid firebase email', () {
      expect(
          _authFunctions.register(_mockAuthRepository.invalidEmail,
              _mockAuthRepository.validPassword, _mockAuthRepository.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_INVALID_EMAIL)));
    });

    test('Register should fail if password is less than 6 characters', () {
      expect(
          _authFunctions.register(_mockAuthRepository.validEmail,
              _mockAuthRepository.weakPassword, _mockAuthRepository.weakPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_WEAK_PASSWORD)));
    });

    test('Register should fail if email already exists', () {
      expect(
          _authFunctions.register(_mockAuthRepository.registeredEmail,
              _mockAuthRepository.validPassword, _mockAuthRepository.validPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionMessages.MESSAGE_EMAIL_ALREADY_IN_USE)));
    });
  });
}

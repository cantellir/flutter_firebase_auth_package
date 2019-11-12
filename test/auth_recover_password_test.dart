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
    test('Recover should fail with blank e-mail', () {
      expect(
          _authFunctions.recoverPassword(''),
          throwsA(predicate(
              (e) => e.message == AuthExceptionMessages.MESSAGE_BLANK_EMAIL)));
    });
  });

  group('External/firebase tests', () {
    test('Recover should fail with invalid firebase email', () {
      expect(
          _authFunctions.recoverPassword(_mockAuthRepository.invalidEmail),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_INVALID_EMAIL)));
    });

    test('Recover should fail with not found firebase email', () {
      expect(
          _authFunctions.recoverPassword(_mockAuthRepository.notFountEmail),
          throwsA(predicate((e) =>
              e.message == AuthExceptionMessages.MESSAGE_USER_NOT_FOUND)));
    });
  });
}

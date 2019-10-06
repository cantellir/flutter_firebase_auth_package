import 'package:firebase_auth_package/src/auth_register.dart';
import 'package:firebase_auth_package/src/exceptions/auth_exceptions_messages.dart';
import 'package:flutter_test/flutter_test.dart';

import 'auth_service_mock.dart';

void main() {
  AuthRegister _authRegister;
  AuthServiceMock _authServiceMock;

  setUp(() {
    _authServiceMock = AuthServiceMock();
    _authRegister = AuthRegister(_authServiceMock);
  });

  group('Internal tests - before call firebase functions', () {
    test('Register should fail with all blank fields', () {
      expect(
          _authRegister.register('', '', '', ''),
          throwsA(predicate((e) =>
              e.message == AuthExceptionsMessages.MESSAGE_BLANK_FIELDS)));
    });

    test('Register should fail with blank name', () {
      expect(
          _authRegister.register('', _authServiceMock.validEmail,
              _authServiceMock.validPassword, _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionsMessages.MESSAGE_BLANK_FIELDS)));
    });

    test('Register should fail with blank email', () {
      expect(
          _authRegister.register(_authServiceMock.validName, '',
              _authServiceMock.validPassword, _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionsMessages.MESSAGE_BLANK_FIELDS)));
    });

    test('Register should fail with blank password', () {
      expect(
          _authRegister.register(_authServiceMock.validName,
              _authServiceMock.validEmail, '', _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionsMessages.MESSAGE_BLANK_FIELDS)));
    });

    test('Register should fail with blank password confirmation', () {
      expect(
          _authRegister.register(_authServiceMock.validName,
              _authServiceMock.validEmail, _authServiceMock.validPassword, ''),
          throwsA(predicate((e) =>
              e.message == AuthExceptionsMessages.MESSAGE_BLANK_FIELDS)));
    });

    test(
        'Register should fail if password and password confirmation are not equals',
        () {
      expect(
          _authRegister.register(
              _authServiceMock.validName,
              _authServiceMock.validEmail,
              _authServiceMock.validPassword,
              _authServiceMock.invalidPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionsMessages.MESSAGE_PASSWORD_CONFIRMATION)));
    });
  });

  group('External/firebase tests', () {
    // test('Loading stream must be false after register success', () async {
    //   await _authRegister.register(
    //       _authServiceMock.validName,
    //       _authServiceMock.validEmail,
    //       _authServiceMock.validPassword,
    //       _authServiceMock.validPassword);
    //   expect(_authRegister.isLoadingStream, emits(false));
    // });

    // test('Loading stream must be false after register fails', () async {
    //   try {
    //     await authBloc.register(
    //         authServiceMock.validName,
    //         authServiceMock.invalidEmail,
    //         authServiceMock.validPassword,
    //         authServiceMock.validPassword);
    //   } catch (e) {
    //     expect(authBloc.isLoadingStream, emits(false));
    //   }
    // });

    test('Register should fail with invalid firebase email', () {
      expect(
          _authRegister.register(
              _authServiceMock.validName,
              _authServiceMock.invalidEmail,
              _authServiceMock.validPassword,
              _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionsMessages.MESSAGE_INVALID_EMAIL)));
    });

    test('Register should fail if password is less than 6 characters', () {
      expect(
          _authRegister.register(
              _authServiceMock.validEmail,
              _authServiceMock.validPassword,
              _authServiceMock.weakPassword,
              _authServiceMock.weakPassword),
          throwsA(predicate((e) =>
              e.message == AuthExceptionsMessages.MESSAGE_WEAK_PASSWORD)));
    });

    test('Register should fail if email already exists', () {
      expect(
          _authRegister.register(
              _authServiceMock.validName,
              _authServiceMock.registeredEmail,
              _authServiceMock.validPassword,
              _authServiceMock.validPassword),
          throwsA(predicate((e) =>
              e.message ==
              AuthExceptionsMessages.MESSAGE_EMAIL_ALREADY_IN_USE)));
    });
  });
}

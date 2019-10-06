import 'package:firebase_auth_package/src/exceptions/auth_exceptions_errors.dart';
import 'package:firebase_auth_package/src/exceptions/auth_exceptions_messages.dart';

class AuthExceptionsMap {
  static const Map<String, String> mapErrorMessages = {
    AuthExceptionsErrors.INTERNAL_ERROR_BLANK_FIELDS:
        AuthExceptionsMessages.MESSAGE_BLANK_FIELDS,
    AuthExceptionsErrors.INTERNAL_ERROR_PASSWORD_CONFIRMATION:
        AuthExceptionsMessages.MESSAGE_PASSWORD_CONFIRMATION,
    AuthExceptionsErrors.INTERNAL_ERROR_BLANK_EMAIL_PASSWORD:
        AuthExceptionsMessages.MESSAGE_BLANK_EMAIL_PASSWORD,
    AuthExceptionsErrors.FIREBASE_ERROR_WRONG_PASSWORD:
        AuthExceptionsMessages.MESSAGE_WRONG_PASSWORD,
    AuthExceptionsErrors.FIREBASE_ERROR_INVALID_EMAIL:
        AuthExceptionsMessages.MESSAGE_INVALID_EMAIL,
    AuthExceptionsErrors.FIREBASE_ERROR_USER_NOT_FOUND:
        AuthExceptionsMessages.MESSAGE_USER_NOT_FOUND,
    AuthExceptionsErrors.FIREBASE_ERROR_WEAK_PASSWORD:
        AuthExceptionsMessages.MESSAGE_WEAK_PASSWORD,
    AuthExceptionsErrors.FIREBASE_ERROR_EMAIL_ALREADY_IN_USE:
        AuthExceptionsMessages.MESSAGE_EMAIL_ALREADY_IN_USE,
    AuthExceptionsErrors.FIREBASE_ERROR_TOO_MANY_REQUESTS:
        AuthExceptionsMessages.MESSAGE_TOO_MANY_REQUESTS,
    AuthExceptionsErrors.FIREBASE_ERROR_NETWORK_REQUEST_FAILED:
        AuthExceptionsMessages.MESSAGE_NETWORK_REQUEST_FAILED
  };
}

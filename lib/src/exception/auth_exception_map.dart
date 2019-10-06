import 'package:firebase_auth_package/src/exception/auth_exception_errors.dart';
import 'package:firebase_auth_package/src/exception/auth_exception_messages.dart';

class AuthExceptionMap {
  static const Map<String, String> mapErrorMessages = {
    AuthExceptionErrors.INTERNAL_ERROR_BLANK_FIELDS:
        AuthExceptionMessages.MESSAGE_BLANK_FIELDS,
    AuthExceptionErrors.INTERNAL_ERROR_PASSWORD_CONFIRMATION:
        AuthExceptionMessages.MESSAGE_PASSWORD_CONFIRMATION,
    AuthExceptionErrors.INTERNAL_ERROR_BLANK_EMAIL_PASSWORD:
        AuthExceptionMessages.MESSAGE_BLANK_EMAIL_PASSWORD,
    AuthExceptionErrors.FIREBASE_ERROR_WRONG_PASSWORD:
        AuthExceptionMessages.MESSAGE_WRONG_PASSWORD,
    AuthExceptionErrors.FIREBASE_ERROR_INVALID_EMAIL:
        AuthExceptionMessages.MESSAGE_INVALID_EMAIL,
    AuthExceptionErrors.FIREBASE_ERROR_USER_NOT_FOUND:
        AuthExceptionMessages.MESSAGE_USER_NOT_FOUND,
    AuthExceptionErrors.FIREBASE_ERROR_WEAK_PASSWORD:
        AuthExceptionMessages.MESSAGE_WEAK_PASSWORD,
    AuthExceptionErrors.FIREBASE_ERROR_EMAIL_ALREADY_IN_USE:
        AuthExceptionMessages.MESSAGE_EMAIL_ALREADY_IN_USE,
    AuthExceptionErrors.FIREBASE_ERROR_TOO_MANY_REQUESTS:
        AuthExceptionMessages.MESSAGE_TOO_MANY_REQUESTS,
    AuthExceptionErrors.FIREBASE_ERROR_NETWORK_REQUEST_FAILED:
        AuthExceptionMessages.MESSAGE_NETWORK_REQUEST_FAILED
  };
}

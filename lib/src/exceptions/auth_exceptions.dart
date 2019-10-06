import 'package:firebase_auth_package/src/exceptions/auth_exceptions_map.dart';

class AuthExceptions implements Exception {
  String error;
  String message;

  AuthExceptions({this.error, this.message});

  static void throwException(String error) {
    var listErrors = AuthExceptionsMap.mapErrorMessages;

    for (var mapError in listErrors.entries) {
      if (error.contains(mapError.key)) {
        throw AuthExceptions(error: mapError.key, message: mapError.value);
      }
    }

    throw Exception(error.toString());
  }
}

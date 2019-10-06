import 'package:firebase_auth_package/src/exception/auth_exception_map.dart';

class AuthException implements Exception {
  String error;
  String message;

  AuthException({this.error, this.message});

  static void throwException(String error) {
    var listErrors = AuthExceptionMap.mapErrorMessages;

    for (var mapError in listErrors.entries) {
      if (error.contains(mapError.key)) {
        throw AuthException(error: mapError.key, message: mapError.value);
      }
    }

    throw Exception(error.toString());
  }
}

import 'package:firebase_auth_package/src/auth_login.dart';
import 'package:firebase_auth_package/src/auth_register.dart';
import 'package:firebase_auth_package/src/auth_service_firestore.dart';

class AuthFunctions {
  AuthServiceFirestore _authServiceFirestore = AuthServiceFirestore();

  Future<void> login(String email, String password) async {
    AuthLogin authLogin = AuthLogin(_authServiceFirestore);
    return await authLogin.login(email, password);
  }

  Future<void> register(String name, String email, String password,
      String passwordConfirmation) async {
    AuthRegister authRegister = AuthRegister(_authServiceFirestore);
    return await authRegister.register(
        name, email, password, passwordConfirmation);
  }
}

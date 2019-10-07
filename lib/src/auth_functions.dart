import 'package:firebase_auth_package/src/functions/auth_login.dart';
import 'package:firebase_auth_package/src/functions/auth_logout.dart';
import 'package:firebase_auth_package/src/functions/auth_recover_password.dart';
import 'package:firebase_auth_package/src/functions/auth_register.dart';
import 'package:firebase_auth_package/src/service/auth_service_firestore.dart';

class AuthFunctions {
  AuthServiceFirestore _authServiceFirestore = AuthServiceFirestore();

  Future<void> login(String email, String password) async {
    AuthLogin authLogin = AuthLogin(_authServiceFirestore);
    return await authLogin.login(email, password);
  }

  Future<void> loginByGoogle() async {
    AuthLogin authLogin = AuthLogin(_authServiceFirestore);
    return await authLogin.loginByGoogle();
  }

  Future<void> loginByFacebook() async {
    AuthLogin authLogin = AuthLogin(_authServiceFirestore);
    return await authLogin.loginByFacebook();
  }

  Future<void> register(String name, String email, String password,
      String passwordConfirmation) async {
    AuthRegister authRegister = AuthRegister(_authServiceFirestore);
    return await authRegister.register(
        name, email, password, passwordConfirmation);
  }

  Future<void> logout() async {
    AuthLogout authLogout = AuthLogout(_authServiceFirestore);
    return await authLogout.logout();
  }

  Future<void> recoverPassword(String email) async {
    AuthRecoverPassword authRecoverPassword =
        AuthRecoverPassword(_authServiceFirestore);
    return await authRecoverPassword.recoverPassword(email);
  }
}

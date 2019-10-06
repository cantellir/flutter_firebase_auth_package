import 'package:firebase_auth_package/src/auth_service.dart';

class AuthLogout {
  final AuthService authService;

  AuthLogout(this.authService);

  Future<void> logout() async {
    await authService.logout();
  }
}

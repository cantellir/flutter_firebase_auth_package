abstract class AuthService {
  Future<void> login(String email, String password);
  Future<void> loginByGoogle();
  Future<void> loginByFacebook();
  Future<void> logout();
  Future<void> register(String email, String password);
  Future<void> recoverPassword(String email);
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_package/src/auth_service.dart';

class AuthServiceFirestore implements AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // AuthServiceFirestore({firebaseAuth}) {
  //   this._firebaseAuth = firebaseAuth.instance;
  // }

  @override
  Future<void> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> register(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> recoverPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

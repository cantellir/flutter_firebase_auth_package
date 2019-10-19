import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_package/src/service/auth_service.dart';

class AuthServiceFirestore implements AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

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

  @override
  Future<void> loginByGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> loginByFacebook() async {
    FacebookLogin facebookLogin = FacebookLogin();
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token);
    await _firebaseAuth.signInWithCredential(credential);
  }
}

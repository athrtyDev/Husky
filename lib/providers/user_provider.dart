import 'package:diyi/global/constants.dart';
import 'package:diyi/utils/base_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  UserProvider(this._auth);
  User get user => _auth.currentUser;
  String hsk = Hsk.hsk1;
  bool isPaid = false;

  Stream<User> get authState => _auth.authStateChanges();

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.additionalUserInfo.isNewUser) {
        // todo do smthg
      }
    } else if (result.status == LoginStatus.failed) {
      print("login failed");
      showWarningToasts("Нэвтрэхэд алдаа гарлаа өөр аргаар нэвтрэнэ үү");
    }
    return null;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    if (googleAuth.accessToken != null && googleAuth.idToken != null) {
      // Create a credential from tokens
      final OAuthCredential credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.additionalUserInfo.isNewUser) {
        // todo do smthg
      }
    } else {
      showWarningToasts("Нэвтрэхэд алдаа гарлаа өөр аргаар нэвтрэнэ үү");
    }
    return null;
  }

  Future<UserCredential> logout() async {
    try {
      _auth.signOut();
    } catch (e) {
      print("error $e");
    }
  }

  void setHsk(String hsk) {
    this.hsk = hsk;
    notifyListeners();
  }

  void setPaymentStatus() {
    this.isPaid = !isPaid;
    notifyListeners();
  }
}

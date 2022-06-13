import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                child: InkWell(
                  onTap: () {
                    // todo login
                    // signInWithFacebook();
                    signInWithFacebook1();
                  },
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 10),
                        MyText.medium(
                          "Facebook нэвтрэх",
                          textColor: Styles.whiteColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: InkWell(
                  onTap: () {
                    signInWithGoogle();
                  },
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 10),
                        MyText.medium(
                          "Google нэвтрэх",
                          textColor: Styles.whiteColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> signInWithFacebook() async {
    // Trigger the sign-in flow
    final _instance = FacebookAuth.instance;
    final result = await _instance.login(permissions: [
      'public_profile',
      'email',
    ]);
    final userData = await FacebookAuth.instance.getUserData();
    print("helloo1:: ${result.status}");
    print("helloo:2: ${result.message}");
    print("helloo::3 ${result.accessToken}");
    print("helloo::3 ${result.accessToken.userId}");
    print("helloo::3 ${result.accessToken.token}");
    print("helloo::44 ${userData}");
    // Create a credential from the access token
    // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

    // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> _logOut() async {
    await FacebookAuth.instance.logOut();
    // _accessToken = null;
    // _userData = null;
    setState(() {});
  }

  Future<UserCredential> signInWithFacebook1() async {
    final LoginResult result = await FacebookAuth.instance.login();
    print("helllooo:: ${result.status}");
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Configure SHA-1 certificate and download google-services.json in project settings

    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    print("helllooo:: ${googleAuth.accessToken}");
    print("helllooo:: ${googleUser.email}");

    if (googleAuth.accessToken != null && googleAuth.idToken != null) {
      // Create a credential from the access token
      final OAuthCredential credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.additionalUserInfo.isNewUser) {
        // todo do smthg
        baseFunctions.showSuccessToasts("google sign up success");
      } else {
        baseFunctions.showSuccessToasts("google login success");
      }
    }
    return null;
  }
}

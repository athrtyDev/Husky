import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/UserData.dart';
import 'package:diyi/global/constants.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/utils/base_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  UserProvider(this._auth);
  User get firebaseUser => _auth.currentUser;
  UserData loggedUser;
  List<UserData> listSearchedUser;
  String paidType = PaidType.unpaid;

  Stream<User> get authState => _auth.authStateChanges();

  void signInWithApple() async {
    final AuthorizationResult result = await TheAppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    // 2. check the result
    if (result.status == AuthorizationStatus.authorized) {
      final appleIdCredential = result.credential;
      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: String.fromCharCodes(appleIdCredential.identityToken),
        accessToken: String.fromCharCodes(appleIdCredential.authorizationCode),
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      await loginUser(userCredential.additionalUserInfo.isNewUser, userCredential.user.uid);
    } else
      print(result.status.toString());
  }

  void signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);
      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
        // Once signed in, return the UserCredential
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        await loginUser(userCredential.additionalUserInfo.isNewUser, userCredential.user.uid);
      } else if (result.status == LoginStatus.failed) {
        print("login failed");
        showWarningToasts("Нэвтрэхэд алдаа гарлаа өөр аргаар нэвтрэнэ үү");
      }
      return null;
    } catch (e) {
      print("login failed");
      showWarningToasts("Нэвтрэхэд алдаа гарлаа өөр аргаар нэвтрэнэ үү");
    }
  }

  void loginUser(bool isNew, String uid) async {
    Api api = Api();
    if (isNew) {
      UserData user = UserData(
        uid: uid,
        paidStatus: "",
        role: "",
        hsk: "1",
        name: firebaseUser.displayName,
        paymentEndDate: "",
        createdDate: DateTime.now().toString(),
      );
      user.shortId = await api.addUser(user);
      loggedUser = user;
      calcPaidType();
    } else {
      loggedUser = await api.fetchUser(uid);
      calcPaidType();
    }
    app.writeStorage("user_uid", loggedUser.uid);
    notifyListeners();
  }

  calcPaidType() {
    paidType = (loggedUser.paidStatus == null || loggedUser.paidStatus == "") ? PaidType.unpaid : loggedUser.paidStatus;
    if (loggedUser.paymentEndDate != null && loggedUser.paymentEndDate != "") {
      DateTime expire = DateTime.parse(loggedUser.paymentEndDate);
      if (DateTime.now().isAfter(expire)) {
        paidType = PaidType.unpaid;
      }
    }
  }

  bool canAccessVocabulary(int index) {
    return paidType == PaidType.advanced || paidType == PaidType.basic || index < 2;
  }

  bool canAccessGrammar(int index) {
    return paidType == PaidType.advanced || index < 1;
  }

  void signInWithGoogle() async {
    try {
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
        await loginUser(userCredential.additionalUserInfo.isNewUser, userCredential.user.uid);
      } else {
        showWarningToasts("Нэвтрэхэд алдаа гарлаа өөр аргаар нэвтрэнэ үү");
      }
      return null;
    } catch (e) {
      print("login failed");
      showWarningToasts("Нэвтрэхэд алдаа гарлаа өөр аргаар нэвтрэнэ үү");
    }
  }

  void logout() async {
    try {
      _auth.signOut();
      app.removeStorage("user_uid");
      loggedUser = null;
      paidType = PaidType.unpaid;
      notifyListeners();
    } catch (e) {
      print("error $e");
    }
  }

  void checkLoggedUser() async {
    if (firebaseUser == null) {
      loggedUser = null;
      paidType = PaidType.unpaid;
      app.removeStorage("user_uid");
      return;
    }
    String uid = await app.getStorage("user_uid");
    if (uid != null) {
      Api api = Api();
      loggedUser = await api.fetchUser(uid);
      calcPaidType();
    }
    notifyListeners();
  }

  void setHsk(String hsk) {
    Api api = Api();
    api.changeUserHsk(loggedUser.uid, hsk);
    loggedUser.hsk = hsk;
    notifyListeners();
  }

  void fetchUsersByShortId(String joinedIds) async {
    Api api = Api();
    List<UserData> listFetchedUser = [];
    if (joinedIds == "all") {
      listFetchedUser = await api.fetchAllUser();
    } else {
      List<String> listId = joinedIds.split(";");
      for (var idStr in listId) {
        int id = int.tryParse(idStr) ?? 0;
        if (id != 0) {
          UserData user = await api.fetchUserByShortId(id);
          if (user != null) listFetchedUser.add(user);
        }
      }
    }
    listSearchedUser = listFetchedUser;
    notifyListeners();
  }

  clearSearchedUser() {
    listSearchedUser = null;
    notifyListeners();
  }

  void changeUserPaidStatus(UserData user) async {
    Api api = Api();
    api.changeUserPaidStatus(user);
  }
}

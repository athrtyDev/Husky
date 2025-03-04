import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyi/core/classes/AppStaticData.dart';
import 'package:diyi/core/classes/StudyInChina.dart';
import 'package:diyi/core/classes/UserData.dart';
import 'package:diyi/global/constants.dart';
import 'package:diyi/providers/grammar_practice_model.dart';
import 'package:http/http.dart' as http;

class Api {
  var client = new http.Client();

  Future<List<Map<String, dynamic>>?> getVocabularyLevel() async {
    print("Firestore read: getVocabularyLevel");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('VocabularyLevel').orderBy('hsk', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      // return itemSnapshot.docs.map((type) => new VocabularyLevel.fromJson(type.data() as Map<String, dynamic>)).toList();
      return itemSnapshot.docs.map((type) => type.data() as Map<String, dynamic>).toList();
    }
  }

  Future<List<Map<String, dynamic>>?> getVocabularyGroup() async {
    print("Firestore read: getVocabularyGroup");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('VocabularyGroup').orderBy('groupName', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => type.data() as Map<String, dynamic>).toList();
    }
  }

  Future<List<Map<String, dynamic>>?> getVocabularyByLevel(String hskLevel) async {
    print("Firestore read: getVocabularyByLevel");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('Vocabulary').where('hsk', isEqualTo: hskLevel).get();

    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => type.data() as Map<String, dynamic>).toList();
    }
  }

  Future<List<Map<String, dynamic>>?> getVocabularyByLevelAndGroup(String hskLevel, String group) async {
    print("Firestore read: getVocabularyByLevelAndGroup");
    QuerySnapshot itemSnapshot = await FirebaseFirestore.instance
        .collection('Vocabulary')
        .where('hsk', isEqualTo: hskLevel)
        .where('group', isEqualTo: group)
        .get();

    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => type.data() as Map<String, dynamic>).toList();
    }
  }

  Future<List<Map<String, dynamic>>?> getGrammarLevel() async {
    print("Firestore read: getGrammarLevel");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('GrammarLevel').orderBy('hsk', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => type.data() as Map<String, dynamic>).toList();
    }
  }

  Future<List<Map<String, dynamic>>?> getGrammarGroup() async {
    print("Firestore read: getGrammarGroup");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('GrammarGroup').orderBy('groupName', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => type.data() as Map<String, dynamic>).toList();
    }
  }

  Future<List<Map<String, dynamic>>?> getGrammarByLevelAndGroup(String hskLevel, String group) async {
    print("Firestore read: getGrammarByLevelAndGroup");
    QuerySnapshot itemSnapshot = await FirebaseFirestore.instance
        .collection('Grammar')
        .where('hsk', isEqualTo: hskLevel)
        .where('group', isEqualTo: group)
        .get();

    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => type.data() as Map<String, dynamic>).toList();
    }
  }

  Future<int> addUser(UserData user) async {
    int newUserId;
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('UserData').orderBy('shortId', descending: true).get();
    if (snapshot.docs.isEmpty) {
      newUserId = Constants.startingUserId;
    } else {
      newUserId = UserData.fromJson(snapshot.docs[0].data() as Map<String, dynamic>).shortId! + 1;
    }

    user.shortId = newUserId;
    final CollectionReference ref = FirebaseFirestore.instance.collection('UserData');
    ref.doc().set(user.toJson());
    return newUserId;
  }

  Future<UserData?> fetchUser(String uid) async {
    print("Firestore read: fetchUser");
    QuerySnapshot customerSnapshot = await FirebaseFirestore.instance.collection('UserData').where('uid', isEqualTo: uid).get();

    if (customerSnapshot.docs.isEmpty) {
      return null;
    } else {
      return UserData.fromJson(customerSnapshot.docs[0].data() as Map<String, dynamic>);
    }
  }

  Future<List<UserData>?> fetchAllUser() async {
    print("Firestore read: fetchAllUser");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('UserData').orderBy('shortId', descending: true).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => new UserData.fromJson(type.data() as Map<String, dynamic>)).toList();
    }
  }

  Future<UserData?> fetchUserByShortId(int shortId) async {
    print("Firestore read: fetchUserByShortId");
    QuerySnapshot customerSnapshot =
        await FirebaseFirestore.instance.collection('UserData').where('shortId', isEqualTo: shortId).get();

    if (customerSnapshot.docs.isEmpty) {
      return null;
    } else {
      print("Fetched: ${customerSnapshot.docs.length}");
      return UserData.fromJson(customerSnapshot.docs[0].data() as Map<String, dynamic>);
    }
  }

  Future<void> changeUserHsk(String uid, String hsk) async {
    print("Firestore update: changeUserHsk");
    UserData fetchedUser;
    QuerySnapshot customerSnapshot =
        await FirebaseFirestore.instance.collection('UserData').where('uid', isEqualTo: uid).limit(1).get();

    if (customerSnapshot.docs.isEmpty) {
      return;
    } else {
      fetchedUser = UserData.fromJson(customerSnapshot.docs[0].data() as Map<String, dynamic>);
    }

    fetchedUser.hsk = hsk;
    FirebaseFirestore.instance.collection('UserData').doc(customerSnapshot.docs[0].id).update(fetchedUser.toJson());
  }

  Future<List<GrammarPracticeModel>?> getGrammarPracticeByLevel(String hskLevel) async {
    print("Firestore read: getGrammarPracticeByLevel");

    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('GrammarExercise').where('hsk', isEqualTo: hskLevel).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => GrammarPracticeModel.fromJson(type.data() as Map<String, dynamic>)).toList();
    }
  }

  Future<AppStaticData> getAppStaticData() async {
    print("Firestore read: getAppStaticData");
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('AppStaticData').get();

    if (snapshot.docs.isEmpty) {
      return AppStaticData.empty();
    } else {
      return AppStaticData.fromJson(snapshot.docs[0].data() as Map<String, dynamic>);
    }
  }

  Future<void> changeStaticData(Map<String, dynamic> data) async {
    print("Firestore update: changeStaticData");
    QuerySnapshot customerSnapshot = await FirebaseFirestore.instance.collection('AppStaticData').limit(1).get();

    if (customerSnapshot.docs.isEmpty) {
      return;
    } else {
      FirebaseFirestore.instance.collection('AppStaticData').doc(customerSnapshot.docs[0].id).update(data);
    }
  }

  Future<void> changeUserPaidStatus(UserData userData) async {
    print("Firestore update: changeUserPaidStatus ${userData.paidStatus}");
    QuerySnapshot customerSnapshot =
        await FirebaseFirestore.instance.collection('UserData').where('shortId', isEqualTo: userData.shortId).limit(1).get();

    if (customerSnapshot.docs.isEmpty) {
      return;
    } else {
      FirebaseFirestore.instance.collection('UserData').doc(customerSnapshot.docs[0].id).update(userData.toJson());
    }
  }

  Future<void> removeUser(String uid) async {
    print("Request:::::: removeUser");
    FirebaseFirestore.instance.collection('UserData').where("uid", isEqualTo: uid).get().then((snapshot) {
      snapshot.docs.first.reference.delete();
    });
  }

  Future<List<StudyInChinaModel>?> getStudyInChina() async {
    print("Firestore update: getStudyInChina");
    QuerySnapshot itemSnapshot = await FirebaseFirestore.instance.collection('StudyInChina').get();

    if (itemSnapshot.docs.isEmpty) {
      return null;
    } else {
      return itemSnapshot.docs.map((type) => StudyInChinaModel.fromJson(type.data() as Map<String, dynamic>)).toList();
    }
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyi/core/classes/AppStaticData.dart';
import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/core/classes/GrammarGroup.dart';
import 'package:diyi/core/classes/GrammarLevel.dart';
import 'package:diyi/core/classes/StudyInChina.dart';
import 'package:diyi/core/classes/UserData.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/core/classes/VocabularyGroup.dart';
import 'package:diyi/core/classes/VocabularyLevel.dart';
import 'package:diyi/global/constants.dart';
import 'package:diyi/providers/grammar_practice_model.dart';
import 'package:http/http.dart' as http;

class Api {
  var client = new http.Client();

  Future<List<VocabularyLevel>> getVocabularyLevel() async {
    print("Firestore read: getVocabularyLevel");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('VocabularyLevel').orderBy('hsk', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => new VocabularyLevel.fromJson(type.data())).toList();
    }
  }

  Future<List<VocabularyGroup>> getVocabularyGroup() async {
    print("Firestore read: getVocabularyGroup");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('VocabularyGroup').orderBy('groupName', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => new VocabularyGroup.fromJson(type.data())).toList();
    }
  }

  Future<List<Vocabulary>> getVocabularyByLevel(String hskLevel) async {
    print("Firestore read: getVocabularyByLevel");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('Vocabulary').where('hsk', isEqualTo: hskLevel).get();

    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => new Vocabulary.fromJson(type.data())).toList();
    }
  }

  Future<List<Vocabulary>> getVocabularyByLevelAndGroup(String hskLevel, String group) async {
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
      return itemSnapshot.docs.map((type) => new Vocabulary.fromJson(type.data())).toList();
    }
  }

  Future<List<GrammarLevel>> getGrammarLevel() async {
    print("Firestore read: getGrammarLevel");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('GrammarLevel').orderBy('hsk', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => new GrammarLevel.fromJson(type.data())).toList();
    }
  }

  Future<List<GrammarGroup>> getGrammarGroup() async {
    print("Firestore read: getGrammarGroup");
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('GrammarGroup').orderBy('groupName', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => new GrammarGroup.fromJson(type.data())).toList();
    }
  }

  Future<List<Grammar>> getGrammarByLevelAndGroup(String hskLevel, String group) async {
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
      return itemSnapshot.docs.map((type) => new Grammar.fromJson(type.data())).toList();
    }
  }

  Future<int> addUser(UserData user) async {
    int newUserId;
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('UserData').get();
    if (snapshot.docs.isEmpty) {
      newUserId = Constants.startingUserId;
    } else {
      newUserId = UserData.fromJson(snapshot.docs[0].data()).shortId + 1;
    }

    user.shortId = newUserId;
    final CollectionReference ref = FirebaseFirestore.instance.collection('UserData');
    ref.doc().set(user.toJson());
    return newUserId;
  }

  Future<UserData> fetchUser(String uid) async {
    print("Firestore read: fetchUser");
    QuerySnapshot customerSnapshot = await FirebaseFirestore.instance.collection('UserData').where('uid', isEqualTo: uid).get();

    if (customerSnapshot.docs.isEmpty) {
      return null;
    } else {
      return UserData.fromJson(customerSnapshot.docs[0].data());
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
      fetchedUser = UserData.fromJson(customerSnapshot.docs[0].data());
    }

    fetchedUser.hsk = hsk;
    FirebaseFirestore.instance.collection('UserData').doc(customerSnapshot.docs[0].id).update(fetchedUser.toJson());
  }

  Future<List<GrammarPracticeModel>> getGrammarPracticeByLevel(String hskLevel) async {
    print("Firestore read: getGrammarPracticeByLevel");

    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('GrammarExercise').where('hsk', isEqualTo: hskLevel).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else {
      print("Fetched: ${itemSnapshot.docs.length}");
      return itemSnapshot.docs.map((type) => new GrammarPracticeModel.fromJson(type.data())).toList();
    }
  }

  Future<AppStaticData> getAppStaticData() async {
    print("Firestore read: getAppStaticData");
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('AppStaticData').get();

    if (snapshot.docs.isEmpty) {
      return AppStaticData.empty();
    } else {
      return AppStaticData.fromJson(snapshot.docs[0].data());
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

  Future<List<StudyInChinaModel>> getStudyInChina() async {
    print("Firestore update: getStudyInChina");
    QuerySnapshot itemSnapshot = await FirebaseFirestore.instance.collection('StudyInChina').get();

    if (itemSnapshot.docs.isEmpty) {
      return null;
    } else {
      return itemSnapshot.docs.map((type) => StudyInChinaModel.fromJson(type.data())).toList();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/core/classes/GrammarGroup.dart';
import 'package:diyi/core/classes/GrammarLevel.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/core/classes/VocabularyGroup.dart';
import 'package:diyi/core/classes/VocabularyLevel.dart';
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
}

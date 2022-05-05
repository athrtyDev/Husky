import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/core/classes/VocabularyGroup.dart';
import 'package:diyi/core/classes/VocabularyLevel.dart';
import 'package:http/http.dart' as http;

class Api {
  var client = new http.Client();

  Future<List<VocabularyLevel>> getVocabularyLevel() async {
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('VocabularyLevel').orderBy('hsk', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else
      return itemSnapshot.docs.map((type) => new VocabularyLevel.fromJson(type.data())).toList();
  }

  Future<List<VocabularyGroup>> getVocabularyGroup() async {
    QuerySnapshot itemSnapshot =
        await FirebaseFirestore.instance.collection('VocabularyGroup').orderBy('groupName', descending: false).get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else
      return itemSnapshot.docs.map((type) => new VocabularyGroup.fromJson(type.data())).toList();
  }

  Future<List<Vocabulary>> getAllVocabulary() async {
    QuerySnapshot itemSnapshot = await FirebaseFirestore.instance.collection('Vocabulary').get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else
      return itemSnapshot.docs.map((type) => new Vocabulary.fromJson(type.data())).toList();
  }

  Future<List<Grammar>> getAllGrammar() async {
    QuerySnapshot itemSnapshot = await FirebaseFirestore.instance.collection('Vocabulary').get();
    if (itemSnapshot.docs.isEmpty)
      return null;
    else
      return itemSnapshot.docs.map((type) => new Grammar.fromJson(type.data())).toList();
  }

  // Future<List<Activity>> getActivityByType(String activityType) async {
  //   QuerySnapshot itemSnapshot = await FirebaseFirestore.instance
  //       .collection('Activity')
  //       .where('isActive', isEqualTo: true)
  //       .where('activityType', isEqualTo: activityType)
  //       .get();
  //
  //   if (itemSnapshot.docs.isEmpty)
  //     return null;
  //   else
  //     return itemSnapshot.docs.map((activity) => new Activity.fromJson(activity.data())).toList();
  // }
  //
  // Future<Activity> getActivityById(String id, String type) async {
  //   QuerySnapshot itemSnapshot = await FirebaseFirestore.instance
  //       .collection('Activity')
  //       .where('activityType', isEqualTo: type)
  //       .where('id', isEqualTo: id)
  //       .get();
  //
  //   if (itemSnapshot.docs.isEmpty)
  //     return null;
  //   else {
  //     Activity activity = Activity.fromJson(itemSnapshot.docs[0].data());
  //     return activity;
  //   }
  // }
}

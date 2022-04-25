import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:http/http.dart' as http;

class Api {
  var client = new http.Client();

  Future<List<Vocabulary>> getAllVocabulary() async {
    QuerySnapshot itemSnapshot = await FirebaseFirestore.instance.collection('Vocabulary').get();

    if (itemSnapshot.docs.isEmpty)
      return null;
    else
      return itemSnapshot.docs.map((type) => new Vocabulary.fromJson(type.data())).toList();
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

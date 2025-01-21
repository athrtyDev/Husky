import 'package:diyi/core/api.dart';
import 'package:flutter/foundation.dart';

class VocabularyProvider with ChangeNotifier {
  List<Map<String, dynamic>>? listLevel;
  List<Map<String, dynamic>>? listAllGroup;

  String? selectedLevel;
  List<Map<String, dynamic>>? listSelectedGroup;
  List<Map<String, dynamic>>? listSelectedVocabulary;

  Future<void> cacheAllData() async {
    Api _api = Api();
    if (listLevel == null) listLevel = await _api.getVocabularyLevel();
    if (listAllGroup == null) {
      listAllGroup = await _api.getVocabularyGroup();
      listAllGroup!.sort((a, b) => int.parse(a["groupName"].toString()).compareTo(int.parse(b["groupName"].toString())));
    }
    notifyListeners();
  }

  void selectLevel(String hsk) {
    selectedLevel = hsk;
    listSelectedGroup = [];
    for (var item in listAllGroup!) {
      if (item["hsk"] == hsk) {
        listSelectedGroup!.add(item);
      }
    }
    notifyListeners();
  }

  void selectGroup(String groupName) async {
    Api _api = Api();
    listSelectedVocabulary = await _api.getVocabularyByLevelAndGroup(selectedLevel!, groupName);
    notifyListeners();
  }
}

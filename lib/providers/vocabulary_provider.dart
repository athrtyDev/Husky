import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/core/classes/VocabularyGroup.dart';
import 'package:diyi/core/classes/VocabularyLevel.dart';
import 'package:flutter/foundation.dart';

class VocabularyProvider with ChangeNotifier {
  List<VocabularyLevel>? listLevel;
  List<VocabularyGroup>? listAllGroup;

  String? selectedLevel;
  List<VocabularyGroup>? listSelectedGroup;
  List<Vocabulary>? listSelectedVocabulary;

  Future<void> cacheAllData() async {
    Api _api = Api();
    if (listLevel == null) listLevel = await _api.getVocabularyLevel();
    if (listAllGroup == null) {
      listAllGroup = await _api.getVocabularyGroup();
      listAllGroup!.sort((a, b) => int.parse(a.groupName!).compareTo(int.parse(b.groupName!)));
    }
    notifyListeners();
  }

  void selectLevel(String hsk) {
    selectedLevel = hsk;
    listSelectedGroup = [];
    for (var item in listAllGroup!) {
      if (item.hsk == hsk) {
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

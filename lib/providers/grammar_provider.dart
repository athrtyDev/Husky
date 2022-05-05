import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/core/classes/VocabularyGroup.dart';
import 'package:diyi/core/classes/VocabularyLevel.dart';
import 'package:flutter/foundation.dart';

class GrammarProvider with ChangeNotifier {
  List<VocabularyLevel> listLevel;
  List<VocabularyGroup> listAllGroup;
  List<Grammar> listAllGrammar;

  String selectedLevel;
  List<VocabularyGroup> listSelectedGroup;
  List<Grammar> listSelectedGrammar;

  Future<void> cacheAllData() async {
    Api _api = Api();
    if (listLevel == null) listLevel = await _api.getVocabularyLevel();
    if (listAllGroup == null) listAllGroup = await _api.getVocabularyGroup();
    if (listAllGrammar == null) listAllGrammar = await _api.getAllGrammar();
    notifyListeners();
  }

  void selectLevel(String hsk) {
    selectedLevel = hsk;
    listSelectedGroup = [];
    for (var item in listAllGroup) {
      if (item.hsk == hsk) {
        listSelectedGroup.add(item);
      }
    }
    notifyListeners();
  }

  void selectGroup(String groupName) {
    listSelectedGrammar = [];
    for (var item in listAllGrammar) {
      if (item.hsk == selectedLevel && item.group == groupName) {
        listSelectedGrammar.add(item);
      }
    }
    notifyListeners();
  }
}

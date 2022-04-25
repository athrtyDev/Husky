import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/core/classes/VocabularyGroup.dart';
import 'package:flutter/foundation.dart';

class VocabularyProvider with ChangeNotifier {
  List<VocabularyGroup> listGroup = [];
  List<Vocabulary> listVocabulary;
  Map<String, int> hskTotal = new Map<String, int>();

  Future<List<Vocabulary>> getAllVocabulary() async {
    if (listVocabulary == null) {
      Api _api = Api();
      return await _api.getAllVocabulary();
    } else
      return listVocabulary;
  }

  void init() async {
    List<Vocabulary> listAll = await getAllVocabulary();
    hskTotal = new Map<String, int>();
    // HSK count
    for (var item in listAll) {
      if (hskTotal.containsKey(item.hsk))
        hskTotal[item.hsk]++;
      else
        hskTotal[item.hsk] = 1;
    }
    // Get group list of HSK level
    getGroupList("1");
    notifyListeners();
  }

  void getGroupList(String hskLevel) async {
    List<Vocabulary> listAll = await getAllVocabulary();
    Map<String, List<Vocabulary>> mapGroup = Map<String, List<Vocabulary>>();
    for (var item in listAll) {
      if (item.hsk == hskLevel) {
        List<Vocabulary> listVocabulary = mapGroup[item.group] ?? [];
        listVocabulary.add(item);
        mapGroup[item.group] = listVocabulary;
      }
    }

    listGroup = [];
    for (var key in mapGroup.keys) {
      listGroup.add(VocabularyGroup(name: key, listVocabulary: mapGroup[key]));
    }
    notifyListeners();
  }
}

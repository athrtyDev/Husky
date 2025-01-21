import 'package:diyi/core/api.dart';
import 'package:flutter/foundation.dart';

class GrammarProvider with ChangeNotifier {
  List<Map<String, dynamic>>? listLevel;
  List<Map<String, dynamic>>? listAllGroup;
  // List<Grammar> listAllGrammar;

  String? selectedLevel;
  List<Map<String, dynamic>>? listSelectedGroup;
  List<Map<String, dynamic>>? listSelectedGrammar;

  Future<void> cacheAllData() async {
    Api _api = Api();
    if (listLevel == null) listLevel = await _api.getGrammarLevel();
    if (listAllGroup == null) {
      listAllGroup = await _api.getGrammarGroup();
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
    listSelectedGrammar = await _api.getGrammarByLevelAndGroup(selectedLevel!, groupName);
    notifyListeners();
  }
}

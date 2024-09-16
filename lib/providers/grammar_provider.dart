import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/core/classes/GrammarGroup.dart';
import 'package:diyi/core/classes/GrammarLevel.dart';
import 'package:flutter/foundation.dart';

class GrammarProvider with ChangeNotifier {
  List<GrammarLevel>? listLevel;
  List<GrammarGroup>? listAllGroup;
  // List<Grammar> listAllGrammar;

  String? selectedLevel;
  List<GrammarGroup>? listSelectedGroup;
  List<Grammar>? listSelectedGrammar;

  Future<void> cacheAllData() async {
    Api _api = Api();
    if (listLevel == null) listLevel = await _api.getGrammarLevel();
    if (listAllGroup == null) {
      listAllGroup = await _api.getGrammarGroup();
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
    listSelectedGrammar = await _api.getGrammarByLevelAndGroup(selectedLevel!, groupName);
    notifyListeners();
  }
}

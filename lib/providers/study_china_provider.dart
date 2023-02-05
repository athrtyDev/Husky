import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/core/classes/GrammarGroup.dart';
import 'package:diyi/core/classes/GrammarLevel.dart';
import 'package:diyi/core/classes/StudyInChina.dart';
import 'package:flutter/foundation.dart';

class StudyChinaProvider with ChangeNotifier {
  List<StudyInChinaModel> studyChina;

  Future<void> cacheAllData() async {
    Api _api = Api();
    if (studyChina == null) studyChina = await _api.getStudyInChina();
    notifyListeners();
  }
}

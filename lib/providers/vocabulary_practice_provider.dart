import 'dart:math';
import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/PracticeModel.dart';
import 'package:diyi/global/constants.dart';
import 'package:flutter/foundation.dart';

class VocabularyPracticeProvider with ChangeNotifier {
  List<PracticeModel>? listVocabularyPractice;
  // List<GrammarPracticeModel> listGrammarPractice;
  int? questionIndex;
  int? totalQuestions;
  int? totalCorrectAnswers;
  bool? isAnswered;
  List<Map<String, dynamic>>? listAllVocabulary;
  List<Map<String, dynamic>>? listWrongVocabulary;
  // List<GrammarPracticeModel> listWrongGrammar;
  // bool isGrammarEmpty = false;

  Future<void> initVocabularyTest(String hsk) async {
    listVocabularyPractice = null;
    notifyListeners();
    await initVocabularyPracticeQuestions(hsk);
    questionIndex = 0;
    totalQuestions = Constants.practiceVocabularyQuestions;
    totalCorrectAnswers = 0;
    isAnswered = false;
    listWrongVocabulary = [];
    notifyListeners();
  }

  void chooseQuestionVocabulary(PracticeChoice choice) {
    totalCorrectAnswers = totalCorrectAnswers! + (choice.isCorrect! ? 1 : 0);
    isAnswered = true;
    if (choice.isCorrect!) {
      choice.status = ChoiceStatus.correct;
    } else {
      for (var item in listVocabularyPractice![questionIndex!].listChoice!) {
        if (item.isCorrect!) {
          item.status = ChoiceStatus.correct;
          listWrongVocabulary!.add(item.data);
        }
      }
      choice.status = ChoiceStatus.wrong;
    }
    notifyListeners();
  }

  void nextQuestion() {
    questionIndex = questionIndex! + 1;
    isAnswered = false;
    notifyListeners();
  }

  void clearPracticeList() {
    listAllVocabulary = null;
    // listGrammarPractice = null;
  }

  Future<void> initVocabularyPracticeQuestions(String hskLevel) async {
    Api _api = Api();
    listVocabularyPractice = null;
    if (listAllVocabulary == null) {
      listAllVocabulary = await _api.getVocabularyByLevel(hskLevel);
      if (listAllVocabulary == null) {
        listVocabularyPractice = [];
        return;
      }
    }
    listVocabularyPractice = [];

    List<Map<String, dynamic>> listAllExceptAsked = List.from(listAllVocabulary!);
    for (int i = 0; i < Constants.practiceVocabularyQuestions; i++) {
      Map<String, dynamic> correctVocabulary = listAllExceptAsked[Random().nextInt(listAllExceptAsked.length)];
      listAllExceptAsked.remove(correctVocabulary);
      bool askChinese = Random().nextBool();

      // populate choices
      List<PracticeChoice> listChoice = [];
      // add correct choice
      listChoice.add(PracticeChoice(
        text: askChinese
            ? correctVocabulary["translation"]
            : "${correctVocabulary["word"]} (${correctVocabulary["pronunciation"]})",
        isCorrect: true,
        data: correctVocabulary,
      ));

      // add wrong choices
      List<Map<String, dynamic>> listAllExceptCorrect = List.from(listAllVocabulary!);
      listAllExceptCorrect.remove(correctVocabulary);
      listAllExceptCorrect.shuffle();
      for (int c = 0; c < 3; c++) {
        listChoice.add(PracticeChoice(
          text: askChinese
              ? listAllExceptCorrect[c]["translation"]
              : "${listAllExceptCorrect[c]["word"]} (${listAllExceptCorrect[c]["pronunciation"]})",
          isCorrect: false,
          data: listAllExceptCorrect[c],
        ));
      }
      listChoice.shuffle();

      // practice model
      PracticeModel practice = PracticeModel(
        question: askChinese ? correctVocabulary["word"] : correctVocabulary["translation"],
        questionDesc: askChinese ? correctVocabulary["pronunciation"] : null,
        listChoice: listChoice,
      );
      listVocabularyPractice!.add(practice);
    }
  }

  void initGroupPractice(List<dynamic> listVocabulary) {
    listVocabularyPractice = null;
    initGroupPracticeQuestions(listVocabulary);
    questionIndex = 0;
    totalQuestions = listVocabulary.length;
    totalCorrectAnswers = 0;
    isAnswered = false;
    listWrongVocabulary = [];
    notifyListeners();
  }

  void initGroupPracticeQuestions(List<dynamic> listVocabulary) {
    listVocabularyPractice = [];

    List<Map<String, dynamic>> listAllExceptAsked = List.from(listVocabulary);
    for (int i = 0; i < listVocabulary.length; i++) {
      Map<String, dynamic> correctVocabulary = listAllExceptAsked[Random().nextInt(listAllExceptAsked.length)];
      listAllExceptAsked.remove(correctVocabulary);
      bool askChinese = Random().nextBool();

      // populate choices
      List<PracticeChoice> listChoice = [];
      // add correct choice
      listChoice.add(PracticeChoice(
        text: askChinese
            ? correctVocabulary["translation"]
            : "${correctVocabulary["word"]} (${correctVocabulary["pronunciation"]})",
        isCorrect: true,
        data: correctVocabulary,
      ));

      // add wrong choices
      List<Map<String, dynamic>> listAllExceptCorrect = List.from(listVocabulary);
      listAllExceptCorrect.remove(correctVocabulary);
      listAllExceptCorrect.shuffle();
      for (int c = 0; c < 3; c++) {
        listChoice.add(PracticeChoice(
          text: askChinese
              ? listAllExceptCorrect[c]["translation"]
              : "${listAllExceptCorrect[c]["word"]} (${listAllExceptCorrect[c]["pronunciation"]})",
          isCorrect: false,
          data: listAllExceptCorrect[c],
        ));
      }
      listChoice.shuffle();

      // practice model
      PracticeModel practice = PracticeModel(
        question: askChinese ? correctVocabulary["word"] : correctVocabulary["translation"],
        questionDesc: askChinese ? correctVocabulary["pronunciation"] : null,
        listChoice: listChoice,
      );
      listVocabularyPractice!.add(practice);
    }
  }
}

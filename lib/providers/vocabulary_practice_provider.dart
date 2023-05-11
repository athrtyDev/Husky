import 'dart:math';
import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/core/classes/PracticeModel.dart';
import 'package:diyi/global/constants.dart';
import 'package:flutter/foundation.dart';

class VocabularyPracticeProvider with ChangeNotifier {
  List<PracticeModel> listVocabularyPractice;
  // List<GrammarPracticeModel> listGrammarPractice;
  int questionIndex;
  int totalQuestions;
  int totalCorrectAnswers;
  bool isAnswered;
  List<Vocabulary> listAllVocabulary;
  List<Vocabulary> listWrongVocabulary;
  // List<GrammarPracticeModel> listWrongGrammar;
  // bool isGrammarEmpty = false;

  void initVocabularyTest(String hsk) async {
    listVocabularyPractice = null;
    notifyListeners();
    await initVocabularyPracticeQuestions(hskLevel: hsk);
    questionIndex = 0;
    totalQuestions = Constants.practiceVocabularyQuestions;
    totalCorrectAnswers = 0;
    isAnswered = false;
    listWrongVocabulary = [];
    notifyListeners();
  }

  void chooseQuestionVocabulary(PracticeChoice choice) {
    totalCorrectAnswers = totalCorrectAnswers + (choice.isCorrect ? 1 : 0);
    isAnswered = true;
    if (choice.isCorrect) {
      choice.status = ChoiceStatus.correct;
    } else {
      for (var item in listVocabularyPractice[questionIndex].listChoice) {
        if (item.isCorrect) {
          item.status = ChoiceStatus.correct;
          listWrongVocabulary.add(item.data);
        }
      }
      choice.status = ChoiceStatus.wrong;
    }
    notifyListeners();
  }

  void nextQuestion() {
    questionIndex++;
    isAnswered = false;
    notifyListeners();
  }

  void clearPracticeList() {
    listAllVocabulary = null;
    // listGrammarPractice = null;
  }

  void initVocabularyPracticeQuestions({String hskLevel}) async {
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

    List<Vocabulary> listAllExceptAsked = List.from(listAllVocabulary);
    for (int i = 0; i < Constants.practiceVocabularyQuestions; i++) {
      Vocabulary correctVocabulary = listAllExceptAsked[Random().nextInt(listAllExceptAsked.length)];
      listAllExceptAsked.remove(correctVocabulary);
      bool askChinese = Random().nextBool();

      // populate choices
      List<PracticeChoice> listChoice = [];
      // add correct choice
      listChoice.add(PracticeChoice(
        text: askChinese ? correctVocabulary.translation : "${correctVocabulary.word} (${correctVocabulary.pronunciation})",
        isCorrect: true,
        data: correctVocabulary,
      ));

      // add wrong choices
      List<Vocabulary> listAllExceptCorrect = List.from(listAllVocabulary);
      listAllExceptCorrect.remove(correctVocabulary);
      listAllExceptCorrect.shuffle();
      for (int c = 0; c < 3; c++) {
        listChoice.add(PracticeChoice(
          text: askChinese
              ? listAllExceptCorrect[c].translation
              : "${listAllExceptCorrect[c].word} (${listAllExceptCorrect[c].pronunciation})",
          isCorrect: false,
          data: listAllExceptCorrect[c],
        ));
      }
      listChoice.shuffle();

      // practice model
      PracticeModel practice = PracticeModel(
        question: askChinese ? correctVocabulary.word : correctVocabulary.translation,
        questionDesc: askChinese ? correctVocabulary.pronunciation : null,
        listChoice: listChoice,
      );
      listVocabularyPractice.add(practice);
    }
  }
}

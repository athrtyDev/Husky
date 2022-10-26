import 'dart:math';
import 'package:diyi/core/api.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/core/classes/PracticeModel.dart';
import 'package:diyi/global/constants.dart';
import 'package:flutter/foundation.dart';

class PracticeProvider with ChangeNotifier {
  List<PracticeModel> listPractice;
  int questionIndex;
  int totalQuestions;
  int totalCorrectAnswers;
  bool isAnswered;
  List<Vocabulary> listAllVocabulary;
  List<Vocabulary> listWrongVocabulary;

  void initTest() async {
    listPractice = null;
    notifyListeners();
    await initPracticeQuestions(hskLevel: "1");
    questionIndex = 0;
    totalQuestions = Constants.practiceVocabularyQuestions;
    totalCorrectAnswers = 0;
    isAnswered = false;
    listWrongVocabulary = [];
    notifyListeners();
  }

  void chooseQuestion(PracticeChoice choice) {
    totalCorrectAnswers = totalCorrectAnswers + (choice.isCorrect ? 1 : 0);
    isAnswered = true;
    if (choice.isCorrect) {
      choice.status = ChoiceStatus.correct;
    } else {
      for (var item in listPractice[questionIndex].listChoice) {
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

  void clearListVocabulary() {
    listAllVocabulary = null;
  }

  void initPracticeQuestions({String hskLevel}) async {
    Api _api = Api();
    if (listAllVocabulary == null) {
      listAllVocabulary = await _api.getVocabularyByLevel(hskLevel);
    }
    List<Vocabulary> listAllExceptAsked = List.from(listAllVocabulary);
    listPractice = [];
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
      listPractice.add(practice);
    }
  }
}

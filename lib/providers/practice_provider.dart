import 'package:flutter/foundation.dart';

class PracticeProvider with ChangeNotifier {
  int totalQuestions;
  int correctCount;
  int currentQuestionIndex;
  bool isChoiceSelected;
  String correctAnswer;
  String selectedAnswer;

  void init(int total) {
    totalQuestions = total;
    currentQuestionIndex = 1;
    correctCount = 0;
    isChoiceSelected = false;
  }

  void chooseAnswer(String text) {
    if (!isChoiceSelected) {
      isChoiceSelected = true;
      selectedAnswer = text;
      if (selectedAnswer == correctAnswer) correctCount++;
      notifyListeners();
    }
  }

  void goNext() {
    isChoiceSelected = false;
    currentQuestionIndex++;
    notifyListeners();
  }
}

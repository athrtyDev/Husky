import 'package:diyi/core/classes/PracticeModel.dart';

class GrammarPracticeModel {
  String? hsk;
  String? group;
  String? question;
  String? answer;
  String? optiona;
  String? optionb;
  String? optionc;
  String? optiond;
  List<PracticeChoice>? listChoice;
  GrammarPracticeModel(
      {this.question,
      this.answer,
      this.optiona,
      this.optionb,
      this.optionc,
      this.optiond,
      this.hsk,
      this.group,
      this.listChoice});

  GrammarPracticeModel.fromJson(Map<String, dynamic> json) {
    hsk = json['hsk'];
    group = json['group'];
    question = json['question'];
    answer = json['answer'];
    optiona = json['optiona'];
    optionb = json['optionb'];
    optionc = json['optionc'];
    optiond = json['optiond'];
    listChoice = [];
    listChoice!.add(PracticeChoice(text: optiona, isCorrect: optiona == answer));
    listChoice!.add(PracticeChoice(text: optionb, isCorrect: optionb == answer));
    listChoice!.add(PracticeChoice(text: optionc, isCorrect: optionc == answer));
    listChoice!.add(PracticeChoice(text: optiond, isCorrect: optiond == answer));
  }
}

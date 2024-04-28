class PracticeModel {
  String? question;
  String? questionDesc;
  List<PracticeChoice>? listChoice;

  PracticeModel({
    this.question,
    this.questionDesc,
    this.listChoice,
  });
}

enum ChoiceStatus { correct, wrong, undefined }

class PracticeChoice {
  String? text;
  bool? isCorrect;
  ChoiceStatus? status;
  dynamic data;

  PracticeChoice({
    this.text,
    this.isCorrect,
    this.status = ChoiceStatus.undefined,
    this.data,
  });
}

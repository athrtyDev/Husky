class VocabularyLevel {
  String hsk;
  int totalGroup;
  int totalVocabulary;

  VocabularyLevel({this.hsk, this.totalGroup, this.totalVocabulary});

  VocabularyLevel.fromJson(Map<String, dynamic> json) {
    hsk = json['hsk'];
    totalGroup = json['totalGroup'];
    totalVocabulary = json['totalVocabulary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hsk'] = this.hsk;
    data['totalGroup'] = this.totalGroup;
    data['totalVocabulary'] = this.totalVocabulary;
    return data;
  }
}

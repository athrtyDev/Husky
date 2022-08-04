class VocabularyGroup {
  String hsk;
  String groupName;
  int totalVocabulary;

  VocabularyGroup({this.hsk, this.groupName, this.totalVocabulary});

  VocabularyGroup.fromJson(Map<String, dynamic> json) {
    hsk = json['hsk'];
    groupName = json['groupName'];
    totalVocabulary = int.parse(json['totalVocabulary']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hsk'] = this.hsk;
    data['groupName'] = this.groupName;
    data['totalVocabulary'] = this.totalVocabulary;
    return data;
  }
}

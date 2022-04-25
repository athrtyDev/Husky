class Vocabulary {
  String hsk;
  String group;
  String word;
  String translation;
  String pronunciation;
  String example1;
  String example1Translation;

  Vocabulary({this.hsk, this.group, this.word, this.translation, this.pronunciation, this.example1, this.example1Translation});

  Vocabulary.fromJson(Map<String, dynamic> json) {
    hsk = json['hsk'];
    group = json['group'];
    word = json['word'];
    translation = json['translation'];
    pronunciation = json['pronunciation'];
    example1 = json['example1'];
    example1Translation = json['example1_translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hsk'] = this.hsk;
    data['group'] = this.group;
    data['word'] = this.word;
    data['translation'] = this.translation;
    data['pronunciation'] = this.pronunciation;
    data['example1'] = this.example1;
    data['example1_translation'] = this.example1Translation;
    return data;
  }
}

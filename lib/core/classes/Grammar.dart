class Grammar {
  String hsk;
  String group;
  String grammar;
  String translation;
  String pronunciation;
  String type;
  String example1;
  String example1Translation;
  String example1Pronunciation;
  String example2;
  String example2Translation;
  String example2Pronunciation;

  Grammar({
    this.hsk,
    this.group,
    this.grammar,
    this.translation,
    this.pronunciation,
    this.type,
    this.example1,
    this.example1Translation,
    this.example1Pronunciation,
    this.example2,
    this.example2Translation,
    this.example2Pronunciation,
  });

  Grammar.fromJson(Map<String, dynamic> json) {
    hsk = json['hsk'];
    group = json['group'];
    grammar = json['grammar'];
    translation = json['translation'];
    pronunciation = json['pronunciation'];
    type = json['type'];
    example1 = json['example1'];
    example1Translation = json['example1_translation'];
    example1Pronunciation = json['example1_pronunciation'];
    example2 = json['example2'];
    example2Translation = json['example2_translation'];
    example2Pronunciation = json['example2_pronunciation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hsk'] = this.hsk;
    data['group'] = this.group;
    data['grammar'] = this.grammar;
    data['translation'] = this.translation;
    data['pronunciation'] = this.pronunciation;
    data['type'] = this.type;
    data['example1'] = this.example1;
    data['example1_translation'] = this.example1Translation;
    data['example1_pronunciation'] = this.example1Pronunciation;
    data['example2'] = this.example2;
    data['example2_translation'] = this.example2Translation;
    data['example2_pronunciation'] = this.example2Pronunciation;
    return data;
  }
}

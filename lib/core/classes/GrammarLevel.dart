class GrammarLevel {
  String hsk;
  int totalGroup;
  int totalGrammar;

  GrammarLevel({this.hsk, this.totalGroup, this.totalGrammar});

  GrammarLevel.fromJson(Map<String, dynamic> json) {
    hsk = json['hsk'];
    totalGroup = json['totalGroup'];
    totalGrammar = json['totalGrammar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hsk'] = this.hsk;
    data['totalGroup'] = this.totalGroup;
    data['totalGrammar'] = this.totalGrammar;
    return data;
  }
}
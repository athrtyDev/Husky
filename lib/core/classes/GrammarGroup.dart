class GrammarGroup {
  String hsk;
  String groupName;
  int totalGrammar;

  GrammarGroup({this.hsk, this.groupName, this.totalGrammar});

  GrammarGroup.fromJson(Map<String, dynamic> json) {
    hsk = json['hsk'];
    groupName = json['groupName'];
    totalGrammar = json['totalGrammar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hsk'] = this.hsk;
    data['groupName'] = this.groupName;
    data['totalGrammar'] = this.totalGrammar;
    return data;
  }
}

class AppStaticData {
  Map<String, dynamic>? static;

  AppStaticData({this.static});

  AppStaticData.empty() {
    static = Map<String, dynamic>();
  }

  AppStaticData.fromJson(Map<String, dynamic> json) {
    static = json;
  }

  Map<String, dynamic>? toJson() {
    return static;
  }
}

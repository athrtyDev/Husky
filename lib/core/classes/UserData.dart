class UserData {
  String uid;
  String paidStatus;
  String role;
  String hsk;

  UserData({
    this.uid,
    this.paidStatus,
    this.role,
    this.hsk,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    paidStatus = json['paidStatus'];
    role = json['role'];
    hsk = json['hsk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['paidStatus'] = this.paidStatus;
    data['role'] = this.role;
    data['hsk'] = this.hsk;
    return data;
  }
}

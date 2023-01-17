class UserData {
  String uid;
  String name;
  String paidStatus;
  String paymentEndDate;
  String role;
  String hsk;
  int shortId;
  String createdDate;

  UserData({
    this.uid,
    this.name,
    this.paidStatus,
    this.paymentEndDate,
    this.role,
    this.hsk,
    this.shortId,
    this.createdDate,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    paidStatus = json['paidStatus'];
    paymentEndDate = json['paymentEndDate'];
    role = json['role'];
    hsk = json['hsk'];
    shortId = json['shortId'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['paidStatus'] = this.paidStatus;
    data['paymentEndDate'] = this.paymentEndDate;
    data['role'] = this.role;
    data['hsk'] = this.hsk;
    data['shortId'] = this.shortId;
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class StudyInChinaModel {
  List<GroupData>? groupData;
  String? groupName;

  StudyInChinaModel({this.groupData, this.groupName});

  StudyInChinaModel.fromJson(Map<String, dynamic> json) {
    if (json['groupData'] != null) {
      groupData = <GroupData>[];
      json['groupData'].forEach((v) {
        groupData!.add(new GroupData.fromJson(v));
      });
    }
    groupName = json['groupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.groupData != null) {
      data['groupData'] = this.groupData!.map((v) => v.toJson()).toList();
    }
    data['groupName'] = this.groupName;
    return data;
  }
}

class GroupData {
  String? detailImage;
  String? bannerImage;
  String? bannerTitle;

  GroupData({this.detailImage, this.bannerImage, this.bannerTitle});

  GroupData.fromJson(Map<String, dynamic> json) {
    detailImage = json['detailImage'];
    bannerImage = json['bannerImage'];
    bannerTitle = json['bannerTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detailImage'] = this.detailImage;
    data['bannerImage'] = this.bannerImage;
    data['bannerTitle'] = this.bannerTitle;
    return data;
  }
}

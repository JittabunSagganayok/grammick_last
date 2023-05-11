/// message : "success"
/// result : {"id":1,"title":"เงื่อนไขการใช้งาน","created_dt":"2022-10-22T09:15:59.131Z","description":"<p>เงื่อนไขการใช้งาน</p>\n"}

class AppHelpCenterResponse {
  AppHelpCenterResponse({
      this.message, 
      this.result,});

  AppHelpCenterResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? HelpCenter.fromJson(json['result']) : null;
  }
  String? message;
  HelpCenter? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

/// id : 1
/// title : "เงื่อนไขการใช้งาน"
/// created_dt : "2022-10-22T09:15:59.131Z"
/// description : "<p>เงื่อนไขการใช้งาน</p>\n"

class HelpCenter {
  HelpCenter({
      this.id, 
      this.title, 
      this.createdDt, 
      this.description,});

  HelpCenter.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    createdDt = json['created_dt'];
    description = json['description'];
  }
  num? id;
  String? title;
  String? createdDt;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['created_dt'] = createdDt;
    map['description'] = description;
    return map;
  }

}
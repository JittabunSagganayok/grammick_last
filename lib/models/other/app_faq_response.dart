/// message : "success"
/// result : [{"id":1,"title":"คำถามที่พบบ่อย","created_dt":"2022-10-22T09:15:40.838Z","description":"<p><strong>คำถามที่พบบ่อย</strong></p>\n"}]
/// count : 1

class AppFaqResponse {
  AppFaqResponse({
      this.message, 
      this.result, 
      this.count,});

  AppFaqResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Faq.fromJson(v));
      });
    }
    count = json['count'];
  }
  String? message;
  List<Faq>? result;
  num? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    return map;
  }

}

/// id : 1
/// title : "คำถามที่พบบ่อย"
/// created_dt : "2022-10-22T09:15:40.838Z"
/// description : "<p><strong>คำถามที่พบบ่อย</strong></p>\n"

class Faq {
  Faq({
      this.id, 
      this.title, 
      this.createdDt, 
      this.description,});

  Faq.fromJson(dynamic json) {
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
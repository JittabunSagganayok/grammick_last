import 'dart:convert';
/// message : "success"
/// result : [{"id":1,"name":"แบนเนอร์","active":true,"picture":null,"end_date":"2022-09-24T16:03:09.000Z","created_dt":"2022-09-01T16:03:13.350Z","start_date":"2022-09-01T16:03:07.000Z","activity_type":"RIDE"}]

BannerListResponse bannerListResponseFromJson(String str) => BannerListResponse.fromJson(json.decode(str));
String bannerListResponseToJson(BannerListResponse data) => json.encode(data.toJson());
class BannerListResponse {
  BannerListResponse({
      this.message, 
      this.result,});

  BannerListResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Banner.fromJson(v));
      });
    }
  }
  String? message;
  List<Banner>? result;
BannerListResponse copyWith({  String? message,
  List<Banner>? result,
}) => BannerListResponse(  message: message ?? this.message,
  result: result ?? this.result,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "แบนเนอร์"
/// active : true
/// picture : null
/// end_date : "2022-09-24T16:03:09.000Z"
/// created_dt : "2022-09-01T16:03:13.350Z"
/// start_date : "2022-09-01T16:03:07.000Z"
/// activity_type : "RIDE"

Banner resultFromJson(String str) => Banner.fromJson(json.decode(str));
String resultToJson(Banner data) => json.encode(data.toJson());
class Banner {
  Banner({
      this.id, 
      this.name, 
      this.active, 
      this.picture, 
      this.endDate, 
      this.createdDt, 
      this.startDate, 
      this.activityType,});

  Banner.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    picture = json['picture'];
    endDate = json['end_date'];
    createdDt = json['created_dt'];
    startDate = json['start_date'];
    activityType = json['activity_type'];
  }
  int? id;
  String? name;
  bool? active;
  dynamic picture;
  String? endDate;
  String? createdDt;
  String? startDate;
  String? activityType;
Banner copyWith({  int? id,
  String? name,
  bool? active,
  dynamic picture,
  String? endDate,
  String? createdDt,
  String? startDate,
  String? activityType,
}) => Banner(  id: id ?? this.id,
  name: name ?? this.name,
  active: active ?? this.active,
  picture: picture ?? this.picture,
  endDate: endDate ?? this.endDate,
  createdDt: createdDt ?? this.createdDt,
  startDate: startDate ?? this.startDate,
  activityType: activityType ?? this.activityType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['active'] = active;
    map['picture'] = picture;
    map['end_date'] = endDate;
    map['created_dt'] = createdDt;
    map['start_date'] = startDate;
    map['activity_type'] = activityType;
    return map;
  }

}
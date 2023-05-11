import 'dart:convert';
/// message : "success"
/// result : {"id":112,"type":"ACTIVITY","seen":"2023-01-12T17:29:34.885Z","title":"Driver Accepted Order","user_id":47,"deleted_at":null,"created_at":"2023-01-12T16:24:16.555Z","description":null}

NotificationDetailResponse notificationDetailResponseFromJson(String str) => NotificationDetailResponse.fromJson(json.decode(str));
String notificationDetailResponseToJson(NotificationDetailResponse data) => json.encode(data.toJson());
class NotificationDetailResponse {
  NotificationDetailResponse({
      this.message, 
      this.result,});

  NotificationDetailResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? NotificationDetail.fromJson(json['result']) : null;
  }
  String? message;
  NotificationDetail? result;
NotificationDetailResponse copyWith({  String? message,
  NotificationDetail? result,
}) => NotificationDetailResponse(  message: message ?? this.message,
  result: result ?? this.result,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

/// id : 112
/// type : "ACTIVITY"
/// seen : "2023-01-12T17:29:34.885Z"
/// title : "Driver Accepted Order"
/// user_id : 47
/// deleted_at : null
/// created_at : "2023-01-12T16:24:16.555Z"
/// description : null

NotificationDetail resultFromJson(String str) => NotificationDetail.fromJson(json.decode(str));
String resultToJson(NotificationDetail data) => json.encode(data.toJson());
class NotificationDetail {
  NotificationDetail({
      this.id, 
      this.type, 
      this.seen, 
      this.title, 
      this.userId, 
      this.deletedAt, 
      this.createdAt, 
      this.description,});

  NotificationDetail.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    seen = json['seen'];
    title = json['title'];
    userId = json['user_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    description = json['description'];
  }
  num? id;
  String? type;
  String? seen;
  String? title;
  num? userId;
  dynamic deletedAt;
  String? createdAt;
  dynamic description;
NotificationDetail copyWith({  num? id,
  String? type,
  String? seen,
  String? title,
  num? userId,
  dynamic deletedAt,
  String? createdAt,
  dynamic description,
}) => NotificationDetail(  id: id ?? this.id,
  type: type ?? this.type,
  seen: seen ?? this.seen,
  title: title ?? this.title,
  userId: userId ?? this.userId,
  deletedAt: deletedAt ?? this.deletedAt,
  createdAt: createdAt ?? this.createdAt,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['seen'] = seen;
    map['title'] = title;
    map['user_id'] = userId;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['description'] = description;
    return map;
  }

}
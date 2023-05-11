import 'package:cloud_firestore/cloud_firestore.dart';

/// SenderBy : {"id":0,"lastname":"test","name":"test","picture":""}
/// active : false
/// createdAt : ""
/// result : ""
/// type : ""

class ChatResponse {
  ChatResponse({
    this.senderBy,
    this.active,
    this.createdAt,
    this.result,
    this.type,
  });

  ChatResponse.fromJson(dynamic json) {
    senderBy =
        json['SenderBy'] != null ? SenderBy.fromJson(json['SenderBy']) : null;
    active = json['active'];
    createdAt = json['createdAt'];
    result = json['result'];
    type = json['type'];
  }

  SenderBy? senderBy;
  bool? active;
  Timestamp? createdAt;
  String? result;
  String? type;
  num? activityId;
}

/// id : 0
/// lastname : "test"
/// name : "test"
/// picture : ""

class SenderBy {
  SenderBy({
    this.id,
    this.lastname,
    this.name,
    this.picture,
  });

  SenderBy.fromJson(dynamic json) {
    id = json['id'];
    lastname = json['lastname'];
    name = json['name'];
    picture = json['picture'];
  }

  num? id;
  String? lastname;
  String? name;
  String? picture;
}

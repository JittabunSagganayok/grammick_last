import 'package:cloud_firestore/cloud_firestore.dart';

/// SenderBy : {"id":0,"lastname":"test","name":"test","picture":""}
/// active : false
/// createdAt : ""
/// result : ""
/// type : ""

class ChatListResponse {
  ChatListResponse({
    this.id,
  });

  ChatListResponse.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
  }
  num? id;
  String? status;
}

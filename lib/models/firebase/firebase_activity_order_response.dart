import 'dart:convert';
/// id : 0
/// type : "RIDE"
/// status : "PENDING"
/// driver_id : 0

FirebaseActivityOrderResponse firebaseActivityOrderResponseFromJson(String str) => FirebaseActivityOrderResponse.fromJson(json.decode(str));
String firebaseActivityOrderResponseToJson(FirebaseActivityOrderResponse data) => json.encode(data.toJson());
class FirebaseActivityOrderResponse {
  FirebaseActivityOrderResponse({
      this.id, 
      this.type, 
      this.status, 
      this.driverId,});

  FirebaseActivityOrderResponse.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    driverId = json['driver_id'];
  }
  num? id;
  String? type;
  String? status;
  num? driverId;
FirebaseActivityOrderResponse copyWith({  num? id,
  String? type,
  String? status,
  num? driverId,
}) => FirebaseActivityOrderResponse(  id: id ?? this.id,
  type: type ?? this.type,
  status: status ?? this.status,
  driverId: driverId ?? this.driverId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['status'] = status;
    map['driver_id'] = driverId;
    return map;
  }

}
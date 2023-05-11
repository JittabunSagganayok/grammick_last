import 'dart:convert';
/// driver_id : "0'"
/// id : "0'"
/// status : ""
/// type : ""

FirebaseActivityResponse firebaseActivityResponseFromJson(String str) => FirebaseActivityResponse.fromJson(json.decode(str));
String firebaseActivityResponseToJson(FirebaseActivityResponse data) => json.encode(data.toJson());
class FirebaseActivityResponse {
  FirebaseActivityResponse({
      this.driverId, 
      this.id, 
      this.status, 
      this.type,});

  FirebaseActivityResponse.fromJson(dynamic json) {
    driverId = json['driver_id'];
    id = json['id'];
    status = json['status'];
    type = json['type'];
  }
  num? driverId;
  num? id;
  String? status;
  String? type;
FirebaseActivityResponse copyWith({  num? driverId,
  num? id,
  String? status,
  String? type,
}) => FirebaseActivityResponse(  driverId: driverId ?? this.driverId,
  id: id ?? this.id,
  status: status ?? this.status,
  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_id'] = driverId;
    map['id'] = id;
    map['status'] = status;
    map['type'] = type;
    return map;
  }

}
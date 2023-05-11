import 'dart:convert';
/// message : "success"
/// result : [{"id":1,"name":"Regular","picture":null}]

AllVehicleTypeReponse allVehicleTypeReponseFromJson(String str) => AllVehicleTypeReponse.fromJson(json.decode(str));
String allVehicleTypeReponseToJson(AllVehicleTypeReponse data) => json.encode(data.toJson());
class AllVehicleTypeReponse {
  AllVehicleTypeReponse({
      this.message, 
      this.result,});

  AllVehicleTypeReponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Vehicle.fromJson(v));
      });
    }
  }
  String? message;
  List<Vehicle>? result;
AllVehicleTypeReponse copyWith({  String? message,
  List<Vehicle>? result,
}) => AllVehicleTypeReponse(  message: message ?? this.message,
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
/// name : "Regular"
/// picture : null

Vehicle resultFromJson(String str) => Vehicle.fromJson(json.decode(str));
String resultToJson(Vehicle data) => json.encode(data.toJson());
class Vehicle {
  Vehicle({
      this.id, 
      this.name,
    this.picture,
    this.cost,});

  Vehicle.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    cost = json['cost'];
    selected = false;
  }
  int? id;
  String? name;
  String? picture;
  String? cost;
  bool selected = false;

Vehicle copyWith({  int? id,
  String? name,
  dynamic picture,
}) => Vehicle(  id: id ?? this.id,
  name: name ?? this.name,
  picture: picture ?? this.picture,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['picture'] = picture;
    return map;
  }

}
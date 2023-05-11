import 'dart:convert';
/// message : "success"
/// result : [{"id":6,"pin":"123456","name":"Driver","role":"DRIVER","email":"iii@oo.ooo","phone":"0900000000","birth":null,"gender":"OTHER","status":"ACTIVE","lastname":"Hi","verifieds":["VERIFIED_OTP","VERIFIED_EMAIL"],"translation_id":null,"lat":13.8583,"lng":100.4688,"Vehicle":{"id":1,"brand":"Toyota AA","model":"Honda","vehicle_type_id":1,"vehicle_type_name":"Regular"},"distance":9752.861817365432}]

NearbyDriverResponse nearbyDriverResponseFromJson(String str) => NearbyDriverResponse.fromJson(json.decode(str));
String nearbyDriverResponseToJson(NearbyDriverResponse data) => json.encode(data.toJson());
class NearbyDriverResponse {
  NearbyDriverResponse({
      this.message, 
      this.result,});

  NearbyDriverResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(DriverList.fromJson(v));
      });
    }
  }
  String? message;
  List<DriverList>? result;
NearbyDriverResponse copyWith({  String? message,
  List<DriverList>? result,
}) => NearbyDriverResponse(  message: message ?? this.message,
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

/// id : 6
/// pin : "123456"
/// name : "Driver"
/// role : "DRIVER"
/// email : "iii@oo.ooo"
/// phone : "0900000000"
/// birth : null
/// gender : "OTHER"
/// status : "ACTIVE"
/// lastname : "Hi"
/// verifieds : ["VERIFIED_OTP","VERIFIED_EMAIL"]
/// translation_id : null
/// lat : 13.8583
/// lng : 100.4688
/// Vehicle : {"id":1,"brand":"Toyota AA","model":"Honda","vehicle_type_id":1,"vehicle_type_name":"Regular"}
/// distance : 9752.861817365432

DriverList resultFromJson(String str) => DriverList.fromJson(json.decode(str));
String resultToJson(DriverList data) => json.encode(data.toJson());
class DriverList {
  DriverList({
      this.id, 
      this.pin, 
      this.name, 
      this.role, 
      this.email, 
      this.phone, 
      this.birth, 
      this.gender, 
      this.status, 
      this.lastname, 
      this.verifieds, 
      this.translationId, 
      this.lat, 
      this.lng, 
      this.vehicle, 
      this.distance,});

  DriverList.fromJson(dynamic json) {
    id = json['id'];
    pin = json['pin'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    phone = json['phone'];
    birth = json['birth'];
    gender = json['gender'];
    status = json['status'];
    lastname = json['lastname'];
    verifieds = json['verifieds'] != null ? json['verifieds'].cast<String>() : [];
    translationId = json['translation_id'];
    lat = json['lat'];
    lng = json['lng'];
    vehicle = json['Vehicle'] != null ? Vehicle.fromJson(json['Vehicle']) : null;
    distance = json['distance'];
  }
  int? id;
  String? pin;
  String? name;
  String? role;
  String? email;
  String? phone;
  dynamic birth;
  String? gender;
  String? status;
  String? lastname;
  List<String>? verifieds;
  dynamic translationId;
  double? lat;
  double? lng;
  Vehicle? vehicle;
  num? distance;
DriverList copyWith({  int? id,
  String? pin,
  String? name,
  String? role,
  String? email,
  String? phone,
  dynamic birth,
  String? gender,
  String? status,
  String? lastname,
  List<String>? verifieds,
  dynamic translationId,
  double? lat,
  double? lng,
  Vehicle? vehicle,
  double? distance,
}) => DriverList(  id: id ?? this.id,
  pin: pin ?? this.pin,
  name: name ?? this.name,
  role: role ?? this.role,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  birth: birth ?? this.birth,
  gender: gender ?? this.gender,
  status: status ?? this.status,
  lastname: lastname ?? this.lastname,
  verifieds: verifieds ?? this.verifieds,
  translationId: translationId ?? this.translationId,
  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
  vehicle: vehicle ?? this.vehicle,
  distance: distance ?? this.distance,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pin'] = pin;
    map['name'] = name;
    map['role'] = role;
    map['email'] = email;
    map['phone'] = phone;
    map['birth'] = birth;
    map['gender'] = gender;
    map['status'] = status;
    map['lastname'] = lastname;
    map['verifieds'] = verifieds;
    map['translation_id'] = translationId;
    map['lat'] = lat;
    map['lng'] = lng;
    if (vehicle != null) {
      map['Vehicle'] = vehicle?.toJson();
    }
    map['distance'] = distance;
    return map;
  }

}

/// id : 1
/// brand : "Toyota AA"
/// model : "Honda"
/// vehicle_type_id : 1
/// vehicle_type_name : "Regular"

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));
String vehicleToJson(Vehicle data) => json.encode(data.toJson());
class Vehicle {
  Vehicle({
      this.id, 
      this.brand, 
      this.model, 
      this.vehicleTypeId, 
      this.vehicleTypeName,});

  Vehicle.fromJson(dynamic json) {
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    vehicleTypeId = json['vehicle_type_id'];
    vehicleTypeName = json['vehicle_type_name'];
  }
  int? id;
  String? brand;
  String? model;
  int? vehicleTypeId;
  String? vehicleTypeName;
Vehicle copyWith({  int? id,
  String? brand,
  String? model,
  int? vehicleTypeId,
  String? vehicleTypeName,
}) => Vehicle(  id: id ?? this.id,
  brand: brand ?? this.brand,
  model: model ?? this.model,
  vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
  vehicleTypeName: vehicleTypeName ?? this.vehicleTypeName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brand'] = brand;
    map['model'] = model;
    map['vehicle_type_id'] = vehicleTypeId;
    map['vehicle_type_name'] = vehicleTypeName;
    return map;
  }

}
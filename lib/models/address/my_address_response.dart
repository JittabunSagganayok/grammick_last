import 'dart:convert';
/// message : "success"
/// result : [{"id":5,"lat":13.90951605279957,"lng":100.5397817632451,"name":"The more bankapi","detail":"hi","address":"hi","current":true,"favorite":false}]

MyAddressResponse myAddressResponseFromJson(String str) => MyAddressResponse.fromJson(json.decode(str));
String myAddressResponseToJson(MyAddressResponse data) => json.encode(data.toJson());
class MyAddressResponse {
  MyAddressResponse({
      this.message, 
      this.result,});

  MyAddressResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(AddressResponse.fromJson(v));
      });
    }
  }
  String? message;
  List<AddressResponse>? result;
MyAddressResponse copyWith({  String? message,
  List<AddressResponse>? result,
}) => MyAddressResponse(  message: message ?? this.message,
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

/// id : 5
/// lat : 13.90951605279957
/// lng : 100.5397817632451
/// name : "The more bankapi"
/// detail : "hi"
/// address : "hi"
/// current : true
/// favorite : false

AddressResponse resultFromJson(String str) => AddressResponse.fromJson(json.decode(str));
String resultToJson(AddressResponse data) => json.encode(data.toJson());
class AddressResponse {
  AddressResponse({
      this.id, 
      this.lat, 
      this.lng, 
      this.name, 
      this.detail, 
      this.address, 
      this.current, 
      this.favorite,});

  AddressResponse.fromJson(dynamic json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    detail = json['detail'];
    address = json['address'];
    current = json['current'];
    favorite = json['favorite'];
  }
  int? id;
  double? lat;
  double? lng;
  String? name;
  String? detail;
  String? address;
  bool? current;
  bool? favorite;
AddressResponse copyWith({  int? id,
  double? lat,
  double? lng,
  String? name,
  String? detail,
  String? address,
  bool? current,
  bool? favorite,
}) => AddressResponse(  id: id ?? this.id,
  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
  name: name ?? this.name,
  detail: detail ?? this.detail,
  address: address ?? this.address,
  current: current ?? this.current,
  favorite: favorite ?? this.favorite,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['detail'] = detail;
    map['address'] = address;
    map['current'] = current;
    map['favorite'] = favorite;
    return map;
  }

}
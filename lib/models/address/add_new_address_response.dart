import 'dart:convert';
/// message : "success"
/// result : {"id":541,"lat":13.8773132,"lng":100.411457,"name":"2 ถ. กาญจนาภิเษก","detail":"2 ถ. กาญจนาภิเษก ตำบล เสาธงหิน อำเภอบางบัวทอง นนทบุรี 11110 ประเทศไทย","address":"2 ถ. กาญจนาภิเษก"}

AddNewAddressResponse addNewAddressResponseFromJson(String str) => AddNewAddressResponse.fromJson(json.decode(str));
String addNewAddressResponseToJson(AddNewAddressResponse data) => json.encode(data.toJson());
class AddNewAddressResponse {
  AddNewAddressResponse({
      this.message, 
      this.result,});

  AddNewAddressResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? message;
  Result? result;
AddNewAddressResponse copyWith({  String? message,
  Result? result,
}) => AddNewAddressResponse(  message: message ?? this.message,
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

/// id : 541
/// lat : 13.8773132
/// lng : 100.411457
/// name : "2 ถ. กาญจนาภิเษก"
/// detail : "2 ถ. กาญจนาภิเษก ตำบล เสาธงหิน อำเภอบางบัวทอง นนทบุรี 11110 ประเทศไทย"
/// address : "2 ถ. กาญจนาภิเษก"

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      this.id, 
      this.lat, 
      this.lng, 
      this.name, 
      this.detail, 
      this.address,});

  Result.fromJson(dynamic json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    detail = json['detail'];
    address = json['address'];
  }
  num? id;
  num? lat;
  num? lng;
  String? name;
  String? detail;
  String? address;
Result copyWith({  num? id,
  num? lat,
  num? lng,
  String? name,
  String? detail,
  String? address,
}) => Result(  id: id ?? this.id,
  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
  name: name ?? this.name,
  detail: detail ?? this.detail,
  address: address ?? this.address,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['detail'] = detail;
    map['address'] = address;
    return map;
  }

}
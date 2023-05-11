import 'dart:convert';
/// lat : 13.910516052799574
/// lng : 100.54078176324511
/// name : "The more bankapi 222"
/// detail : "hi"
/// address : "hi"
/// favorite : false

AddNewAddressRequest addNewAddressRequestFromJson(String str) => AddNewAddressRequest.fromJson(json.decode(str));
String addNewAddressRequestToJson(AddNewAddressRequest data) => json.encode(data.toJson());
class AddNewAddressRequest {
  AddNewAddressRequest({
      this.lat, 
      this.lng, 
      this.name, 
      this.detail, 
      this.address, 
      this.favorite,});

  AddNewAddressRequest.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    address = json['address'];
    detail = json['detail'];
    favorite = json['favorite'];
  }
  double? lat;
  double? lng;
  String? name;
  String? detail;
  String? address;
  bool? favorite;
AddNewAddressRequest copyWith({  double? lat,
  double? lng,
  String? name,
  String? detail,
  String? address,
  bool? favorite,
}) => AddNewAddressRequest(  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
  name: name ?? this.name,
  detail: detail ?? this.detail,
  address: address ?? this.address,
  favorite: favorite ?? this.favorite,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['detail'] = detail;
    map['address'] = address;
    map['favorite'] = favorite;
    return map;
  }

}
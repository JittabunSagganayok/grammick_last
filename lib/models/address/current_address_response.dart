import 'dart:convert';

import 'package:we_link/models/address/my_address_response.dart';

/// message : "success"
/// result : {"id":5,"lat":13.90951605279957,"lng":100.5397817632451,"name":"The more bankapi","detail":"hi","address":"hi"}

CurrentAddressResponse currentAddressResponseFromJson(String str) =>
    CurrentAddressResponse.fromJson(json.decode(str));

String currentAddressResponseToJson(CurrentAddressResponse data) =>
    json.encode(data.toJson());

class CurrentAddressResponse {
  CurrentAddressResponse({
    this.message,
    this.result,
  });

  CurrentAddressResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? AddressResponse.fromJson(json['result']) : null;
  }

  String? message;
  AddressResponse? result;

  CurrentAddressResponse copyWith({
    String? message,
    AddressResponse? result,
  }) =>
      CurrentAddressResponse(
        message: message ?? this.message,
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

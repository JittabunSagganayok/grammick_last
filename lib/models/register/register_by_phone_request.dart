import 'dart:convert';

/// phone : "0640836917"
/// pin : "123456"
/// isRemember : true

RegisterByPhoneRequest registerByPhoneRequestFromJson(String str) =>
    RegisterByPhoneRequest.fromJson(json.decode(str));

String registerByPhoneRequestToJson(RegisterByPhoneRequest data) =>
    json.encode(data.toJson());

class RegisterByPhoneRequest {
  RegisterByPhoneRequest({
    this.phone,
  });

  RegisterByPhoneRequest.fromJson(dynamic json) {
    phone = json['phone'];
  }

  String? phone;

  RegisterByPhoneRequest copyWith({
    String? phone,
    String? pin,
    bool? isRemember,
  }) =>
      RegisterByPhoneRequest(
        phone: phone ?? this.phone,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    return map;
  }
}

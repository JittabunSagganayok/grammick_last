import 'dart:convert';
/// phone : "0800000000"

SigninByPhoneRequest signinByPhoneRequestFromJson(String str) => SigninByPhoneRequest.fromJson(json.decode(str));
String signinByPhoneRequestToJson(SigninByPhoneRequest data) => json.encode(data.toJson());
class SigninByPhoneRequest {
  SigninByPhoneRequest({
      this.phone,});

  SigninByPhoneRequest.fromJson(dynamic json) {
    phone = json['phone'];
  }
  String? phone;
SigninByPhoneRequest copyWith({  String? phone,
}) => SigninByPhoneRequest(  phone: phone ?? this.phone,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    return map;
  }

}
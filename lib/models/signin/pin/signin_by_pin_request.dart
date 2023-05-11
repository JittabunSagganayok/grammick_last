import 'dart:convert';
/// phone : "0640836917"
/// pin : "123456"
/// isRemember : true

SigninByPinRequest signinByPinRequestFromJson(String str) => SigninByPinRequest.fromJson(json.decode(str));
String signinByPinRequestToJson(SigninByPinRequest data) => json.encode(data.toJson());
class SigninByPinRequest {
  SigninByPinRequest({
      this.phone, 
      this.pin, 
      this.isRemember,});

  SigninByPinRequest.fromJson(dynamic json) {
    phone = json['phone'];
    pin = json['pin'];
    isRemember = json['isRemember'];
  }
  String? phone;
  String? pin;
  bool? isRemember;
SigninByPinRequest copyWith({  String? phone,
  String? pin,
  bool? isRemember,
}) => SigninByPinRequest(  phone: phone ?? this.phone,
  pin: pin ?? this.pin,
  isRemember: isRemember ?? this.isRemember,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['pin'] = pin;
    map['isRemember'] = isRemember;
    return map;
  }

}
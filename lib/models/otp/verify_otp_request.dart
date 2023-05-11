import 'dart:convert';
/// phone : "0841115720"
/// otp : "306969"

VerifyOtpRequest verifyOtpRequestFromJson(String str) => VerifyOtpRequest.fromJson(json.decode(str));
String verifyOtpRequestToJson(VerifyOtpRequest data) => json.encode(data.toJson());
class VerifyOtpRequest {
  VerifyOtpRequest({
      this.phone, 
      this.otp,});

  VerifyOtpRequest.fromJson(dynamic json) {
    phone = json['phone'];
    otp = json['otp'];
  }
  String? phone;
  String? otp;
VerifyOtpRequest copyWith({  String? phone,
  String? otp,
}) => VerifyOtpRequest(  phone: phone ?? this.phone,
  otp: otp ?? this.otp,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['otp'] = otp;
    return map;
  }

}
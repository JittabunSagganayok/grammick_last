import 'dart:convert';
/// message : "success"
/// result : {"ref":"DDG8D","otp":"256067","phone":"0640836917","userId":1}

RegisterByPhoneResponse registerByPhoneResponseFromJson(String str) => RegisterByPhoneResponse.fromJson(json.decode(str));
String registerByPhoneResponseToJson(RegisterByPhoneResponse data) => json.encode(data.toJson());
class RegisterByPhoneResponse {
  RegisterByPhoneResponse({
      this.message, 
      this.result,});

  RegisterByPhoneResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? RegisterModel.fromJson(json['result']) : null;
  }
  String? message;
  RegisterModel? result;
RegisterByPhoneResponse copyWith({  String? message,
  RegisterModel? result,
}) => RegisterByPhoneResponse(  message: message ?? this.message,
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

/// ref : "DDG8D"
/// otp : "256067"
/// phone : "0640836917"
/// userId : 1

RegisterModel resultFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String resultToJson(RegisterModel data) => json.encode(data.toJson());
class RegisterModel {
  RegisterModel({
      this.ref, 
      this.otp, 
      this.phone, 
      this.userId,});

  RegisterModel.fromJson(dynamic json) {
    ref = json['ref'];
    otp = json['otp'];
    phone = json['phone'];
    userId = json['userId'];
  }
  String? ref;
  String? otp;
  String? phone;
  int? userId;
RegisterModel copyWith({  String? ref,
  String? otp,
  String? phone,
  int? userId,
}) => RegisterModel(  ref: ref ?? this.ref,
  otp: otp ?? this.otp,
  phone: phone ?? this.phone,
  userId: userId ?? this.userId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ref'] = ref;
    map['otp'] = otp;
    map['phone'] = phone;
    map['userId'] = userId;
    return map;
  }

}
import 'dart:convert';
/// message : "success"
/// result : {"id":2,"pin":"123456","name":"Super","role":"ADMIN","email":null,"phone":"0800000000","birth":null,"gender":"OTHER","status":"ACTIVE","lastname":"Admin","verifieds":["VERIFIED_OTP","VERIFIED_EMAIL"]}

SigninByPhoneResponse signinByPhoneResponseFromJson(String str) => SigninByPhoneResponse.fromJson(json.decode(str));
String signinByPhoneResponseToJson(SigninByPhoneResponse data) => json.encode(data.toJson());
class SigninByPhoneResponse {
  SigninByPhoneResponse({
      this.message, 
      this.result,});

  SigninByPhoneResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? SigninByPhoneResult.fromJson(json['result']) : null;
  }
  String? message;
  SigninByPhoneResult? result;
SigninByPhoneResponse copyWith({  String? message,
  SigninByPhoneResult? result,
}) => SigninByPhoneResponse(  message: message ?? this.message,
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

/// id : 2
/// pin : "123456"
/// name : "Super"
/// role : "ADMIN"
/// email : null
/// phone : "0800000000"
/// birth : null
/// gender : "OTHER"
/// status : "ACTIVE"
/// lastname : "Admin"
/// verifieds : ["VERIFIED_OTP","VERIFIED_EMAIL"]

SigninByPhoneResult resultFromJson(String str) => SigninByPhoneResult.fromJson(json.decode(str));
String resultToJson(SigninByPhoneResult data) => json.encode(data.toJson());
class SigninByPhoneResult {
  SigninByPhoneResult({
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
      this.verifieds,});

  SigninByPhoneResult.fromJson(dynamic json) {
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
  }
  int? id;
  String? pin;
  String? name;
  String? role;
  dynamic email;
  String? phone;
  dynamic birth;
  String? gender;
  String? status;
  String? lastname;
  List<String>? verifieds;
SigninByPhoneResult copyWith({  int? id,
  String? pin,
  String? name,
  String? role,
  dynamic email,
  String? phone,
  dynamic birth,
  String? gender,
  String? status,
  String? lastname,
  List<String>? verifieds,
}) => SigninByPhoneResult(  id: id ?? this.id,
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
    return map;
  }

}
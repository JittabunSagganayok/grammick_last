import 'dart:convert';
/// message : "success"
/// result : {"user":{"id":13,"pin":"123456","name":null,"role":"CUSTOMER","email":null,"phone":"0801234567","birth":null,"gender":"OTHER","status":"ACTIVE","lastname":null,"verifieds":["VERIFIED_OTP"]},"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEzLCJpYXQiOjE2NjIyMTg1OTcsImV4cCI6MTY2MjIxOTQ5N30.d1cyGyIrLdpS6heKOgM-dITJimlWzoxeoBYkL0_aUNg","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEzLCJpYXQiOjE2NjIyMTg1OTcsImV4cCI6MTY2MjgyMzM5N30.yxxtHnSqIi7Yk9_W2clcUCpWAowUPxL58Fi1XJfAdY0"}

SigninByPinResponse signinByPinResponseFromJson(String str) => SigninByPinResponse.fromJson(json.decode(str));
String signinByPinResponseToJson(SigninByPinResponse data) => json.encode(data.toJson());
class SigninByPinResponse {
  SigninByPinResponse({
      this.message, 
      this.result,});

  SigninByPinResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? SigninByPinResult.fromJson(json['result']) : null;
  }
  String? message;
  SigninByPinResult? result;
SigninByPinResponse copyWith({  String? message,
  SigninByPinResult? result,
}) => SigninByPinResponse(  message: message ?? this.message,
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

/// user : {"id":13,"pin":"123456","name":null,"role":"CUSTOMER","email":null,"phone":"0801234567","birth":null,"gender":"OTHER","status":"ACTIVE","lastname":null,"verifieds":["VERIFIED_OTP"]}
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEzLCJpYXQiOjE2NjIyMTg1OTcsImV4cCI6MTY2MjIxOTQ5N30.d1cyGyIrLdpS6heKOgM-dITJimlWzoxeoBYkL0_aUNg"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEzLCJpYXQiOjE2NjIyMTg1OTcsImV4cCI6MTY2MjgyMzM5N30.yxxtHnSqIi7Yk9_W2clcUCpWAowUPxL58Fi1XJfAdY0"

SigninByPinResult resultFromJson(String str) => SigninByPinResult.fromJson(json.decode(str));
String resultToJson(SigninByPinResult data) => json.encode(data.toJson());
class SigninByPinResult {
  SigninByPinResult({
      this.user, 
      this.accessToken, 
      this.refreshToken,});

  SigninByPinResult.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
  User? user;
  String? accessToken;
  String? refreshToken;
SigninByPinResult copyWith({  User? user,
  String? accessToken,
  String? refreshToken,
}) => SigninByPinResult(  user: user ?? this.user,
  accessToken: accessToken ?? this.accessToken,
  refreshToken: refreshToken ?? this.refreshToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }

}

/// id : 13
/// pin : "123456"
/// name : null
/// role : "CUSTOMER"
/// email : null
/// phone : "0801234567"
/// birth : null
/// gender : "OTHER"
/// status : "ACTIVE"
/// lastname : null
/// verifieds : ["VERIFIED_OTP"]

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
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

  User.fromJson(dynamic json) {
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
  dynamic name;
  String? role;
  dynamic email;
  String? phone;
  dynamic birth;
  String? gender;
  String? status;
  dynamic lastname;
  List<String>? verifieds;
User copyWith({  int? id,
  String? pin,
  dynamic name,
  String? role,
  dynamic email,
  String? phone,
  dynamic birth,
  String? gender,
  String? status,
  dynamic lastname,
  List<String>? verifieds,
}) => User(  id: id ?? this.id,
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
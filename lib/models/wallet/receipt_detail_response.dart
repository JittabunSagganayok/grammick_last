import 'dart:convert';
/// message : "success"
/// result : {"code":"1670082086359184D8A645D7","user_id":21,"User":{"id":21,"pin":"123456","name":null,"picture":null,"role":"DRIVER","email":null,"phone":"0640651246","birth":null,"active":true,"gender":"OTHER","status":"ACTIVE","lastname":null,"verifieds":["VERIFIED_OTP"],"device_token":null}}

ReceiptDetailResponse receiptDetailResponseFromJson(String str) => ReceiptDetailResponse.fromJson(json.decode(str));
String receiptDetailResponseToJson(ReceiptDetailResponse data) => json.encode(data.toJson());
class ReceiptDetailResponse {
  ReceiptDetailResponse({
      this.message, 
      this.result,});

  ReceiptDetailResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? message;
  Result? result;
ReceiptDetailResponse copyWith({  String? message,
  Result? result,
}) => ReceiptDetailResponse(  message: message ?? this.message,
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

/// code : "1670082086359184D8A645D7"
/// user_id : 21
/// User : {"id":21,"pin":"123456","name":null,"picture":null,"role":"DRIVER","email":null,"phone":"0640651246","birth":null,"active":true,"gender":"OTHER","status":"ACTIVE","lastname":null,"verifieds":["VERIFIED_OTP"],"device_token":null}

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      this.code, 
      this.userId, 
      this.user,});

  Result.fromJson(dynamic json) {
    code = json['code'];
    userId = json['user_id'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }
  String? code;
  num? userId;
  User? user;
Result copyWith({  String? code,
  num? userId,
  User? user,
}) => Result(  code: code ?? this.code,
  userId: userId ?? this.userId,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['user_id'] = userId;
    if (user != null) {
      map['User'] = user?.toJson();
    }
    return map;
  }

}

/// id : 21
/// pin : "123456"
/// name : null
/// picture : null
/// role : "DRIVER"
/// email : null
/// phone : "0640651246"
/// birth : null
/// active : true
/// gender : "OTHER"
/// status : "ACTIVE"
/// lastname : null
/// verifieds : ["VERIFIED_OTP"]
/// device_token : null

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.pin, 
      this.name, 
      this.picture, 
      this.role, 
      this.email, 
      this.phone, 
      this.birth, 
      this.active, 
      this.gender, 
      this.status, 
      this.lastname, 
      this.verifieds, 
      this.deviceToken,});

  User.fromJson(dynamic json) {
    id = json['id'];
    pin = json['pin'];
    name = json['name'];
    picture = json['picture'];
    role = json['role'];
    email = json['email'];
    phone = json['phone'];
    birth = json['birth'];
    active = json['active'];
    gender = json['gender'];
    status = json['status'];
    lastname = json['lastname'];
    verifieds = json['verifieds'] != null ? json['verifieds'].cast<String>() : [];
    deviceToken = json['device_token'];
  }
  num? id;
  String? pin;
  dynamic name;
  dynamic picture;
  String? role;
  dynamic email;
  String? phone;
  dynamic birth;
  bool? active;
  String? gender;
  String? status;
  dynamic lastname;
  List<String>? verifieds;
  dynamic deviceToken;
User copyWith({  num? id,
  String? pin,
  dynamic name,
  dynamic picture,
  String? role,
  dynamic email,
  String? phone,
  dynamic birth,
  bool? active,
  String? gender,
  String? status,
  dynamic lastname,
  List<String>? verifieds,
  dynamic deviceToken,
}) => User(  id: id ?? this.id,
  pin: pin ?? this.pin,
  name: name ?? this.name,
  picture: picture ?? this.picture,
  role: role ?? this.role,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  birth: birth ?? this.birth,
  active: active ?? this.active,
  gender: gender ?? this.gender,
  status: status ?? this.status,
  lastname: lastname ?? this.lastname,
  verifieds: verifieds ?? this.verifieds,
  deviceToken: deviceToken ?? this.deviceToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pin'] = pin;
    map['name'] = name;
    map['picture'] = picture;
    map['role'] = role;
    map['email'] = email;
    map['phone'] = phone;
    map['birth'] = birth;
    map['active'] = active;
    map['gender'] = gender;
    map['status'] = status;
    map['lastname'] = lastname;
    map['verifieds'] = verifieds;
    map['device_token'] = deviceToken;
    return map;
  }

}
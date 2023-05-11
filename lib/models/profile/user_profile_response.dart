import 'dart:convert';
/// message : "success"
/// result : {"id":6,"pin":"270434","name":"Teerapong Boonkwan","picture":null,"role":"CUSTOMER","email":null,"phone":"0804505845","birth":"1991-04-27T00:00:00.000Z","gender":"MALE","status":"ACTIVE","lastname":null,"verifieds":["VERIFIED_OTP"],"Customer":{"points":0,"user_id":6,"provider":"NONE","provider_id":null,"notification":false}}

UserProfileResponse userProfileResponseFromJson(String str) => UserProfileResponse.fromJson(json.decode(str));
String userProfileResponseToJson(UserProfileResponse data) => json.encode(data.toJson());
class UserProfileResponse {
  UserProfileResponse({
      this.message, 
      this.result,});

  UserProfileResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Profile.fromJson(json['result']) : null;
  }
  String? message;
  Profile? result;
UserProfileResponse copyWith({  String? message,
  Profile? result,
}) => UserProfileResponse(  message: message ?? this.message,
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

/// id : 6
/// pin : "270434"
/// name : "Teerapong Boonkwan"
/// picture : null
/// role : "CUSTOMER"
/// email : null
/// phone : "0804505845"
/// birth : "1991-04-27T00:00:00.000Z"
/// gender : "MALE"
/// status : "ACTIVE"
/// lastname : null
/// verifieds : ["VERIFIED_OTP"]
/// Customer : {"points":0,"user_id":6,"provider":"NONE","provider_id":null,"notification":false}

Profile resultFromJson(String str) => Profile.fromJson(json.decode(str));
String resultToJson(Profile data) => json.encode(data.toJson());
class Profile {
  Profile({
      this.id, 
      this.pin, 
      this.name, 
      this.picture, 
      this.role, 
      this.email, 
      this.phone, 
      this.birth, 
      this.gender, 
      this.status, 
      this.lastname, 
      this.verifieds, 
      this.customer,});

  Profile.fromJson(dynamic json) {
    id = json['id'];
    pin = json['pin'];
    name = json['name'];
    picture = json['picture'];
    role = json['role'];
    email = json['email'];
    phone = json['phone'];
    birth = json['birth'];
    gender = json['gender'];
    status = json['status'];
    lastname = json['lastname'];
    verifieds = json['verifieds'] != null ? json['verifieds'].cast<String>() : [];
    customer = json['Customer'] != null ? Customer.fromJson(json['Customer']) : null;
    notification = json['notification'];
  }
  int? id;
  String? pin;
  String? name;
  dynamic picture;
  String? role;
  dynamic email;
  String? phone;
  String? birth;
  String? gender;
  String? status;
  dynamic lastname;
  List<String>? verifieds;
  Customer? customer;
  bool? notification;
Profile copyWith({  int? id,
  String? pin,
  String? name,
  dynamic picture,
  String? role,
  dynamic email,
  String? phone,
  String? birth,
  String? gender,
  String? status,
  dynamic lastname,
  List<String>? verifieds,
  Customer? customer,
}) => Profile(  id: id ?? this.id,
  pin: pin ?? this.pin,
  name: name ?? this.name,
  picture: picture ?? this.picture,
  role: role ?? this.role,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  birth: birth ?? this.birth,
  gender: gender ?? this.gender,
  status: status ?? this.status,
  lastname: lastname ?? this.lastname,
  verifieds: verifieds ?? this.verifieds,
  customer: customer ?? this.customer,
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
    map['gender'] = gender;
    map['status'] = status;
    map['lastname'] = lastname;
    map['verifieds'] = verifieds;
    if (customer != null) {
      map['Customer'] = customer?.toJson();
    }
    return map;
  }

}

/// points : 0
/// user_id : 6
/// provider : "NONE"
/// provider_id : null
/// notification : false

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));
String customerToJson(Customer data) => json.encode(data.toJson());
class Customer {
  Customer({
      this.points, 
      this.userId, 
      this.provider, 
      this.providerId, });

  Customer.fromJson(dynamic json) {
    points = json['points'];
    userId = json['user_id'];
    provider = json['provider'];
    providerId = json['provider_id'];
  }
  int? points;
  int? userId;
  String? provider;
  dynamic providerId;
Customer copyWith({  int? points,
  int? userId,
  String? provider,
  dynamic providerId,
  bool? notification,
}) => Customer(  points: points ?? this.points,
  userId: userId ?? this.userId,
  provider: provider ?? this.provider,
  providerId: providerId ?? this.providerId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['points'] = points;
    map['user_id'] = userId;
    map['provider'] = provider;
    map['provider_id'] = providerId;
    return map;
  }

}
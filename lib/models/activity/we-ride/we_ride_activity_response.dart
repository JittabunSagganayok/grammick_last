import 'package:we_link/feature/coupon/coupon_response.dart';
import 'package:we_link/models/activity/activity_history_review_response.dart';
import 'package:we_link/models/activity/activity_we_rent_response.dart';
import 'package:we_link/models/activity/assistant/assistant_order_response.dart';

import '../drive-your-car/activity_drive_your_car_response.dart';

/// message : "success"
/// result : {"id":340,"type":"RIDE","total":"0","status":"PROCESS","user_id":47,"order_id":"WE1857D8F9391","coupon_id":null,"driver_id":72,"created_dt":"2023-01-04T16:13:59.571Z","updated_dt":"2023-01-04T16:14:05.807Z","merchant_id":null,"driver_refuse":[],"driver_of_area":[72],"payment_method":"CASH","report_problem":null,"customer_address_id":327,"payment_transection_id":null,"Ride":{"cost":"200","note":null,"status":"ARRIVED","activity_id":340,"additional_cost":null,"vehicle_type_id":4,"Destinations":[{"destination_no":1,"address_id":431,"ride_activity_id":340,"Destination":{"id":431,"lat":13.9407362,"lng":100.5273484,"name":"114 Sukkhaprachasan 2","detail":"114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand","address":"114 Sukkhaprachasan 2"}}],"VehicleType":{"id":4,"name":"Motor Bike","cost":"200","picture":"https://welink.sgp1.cdn.digitaloceanspaces.com/dev/73ff74b5-7fd6-492c-984a-839e153625ec.png"},"Distance":{"km":13,"away_from_you":13,"time":{"hours":0,"minute":24}}},"User":{"id":47,"pin":"111111","name":"teerapong","picture":"dev/d4b08ce0-0c60-4f62-861d-5b3d70580c03.png","role":"CUSTOMER","email":"teerapongb.work@gmail.com","phone":"0804505845","birth":"2022-12-28T00:00:00.000Z","active":true,"gender":"MALE","status":"ACTIVE","lastname":"boonkwan","verifieds":["VERIFIED_OTP"],"device_token":"fgHUdOkuX01pmFpjv7LMQm:APA91bHZIrDfMDqOnD-pkIG3XVBVRBPkdMzqyQdx2Slq1WG7nUj3_EQmoThej9hDPAoCH_IRNI4vAvK7Cbi16qGg6ZQ5A_Bro3l69jylDxNKwBHZaO7qrGSqEoZoxHbvj6FBkW3mS5i6"},"Driver":{"id":72,"pin":"111111","name":"dickjay","picture":"dev/05c33bd9-11da-4a16-aecb-cbb38a3867f6.jpg","role":"DRIVER","email":"teerapong@gmail.com","phone":"0809999999","birth":"2022-12-29T00:00:00.000Z","active":false,"gender":"MALE","status":"INACTIVE","lastname":"boonkwan","verifieds":["VERIFIED_OTP"],"device_token":"c1aFQb55y0FJnPDPX4oucX:APA91bHbU_X2Nfb2yHHeHTRqIPS55uM0P4Vrz4zChoyimBtfvrvPwEjIweJixyfC5ihWULcIXcFL_2eJ-g4f4NdC5xUCIGi0qQMFU33gRf1-CymFiqOzX27i1YDUpxX_vfAQplpT2r0H","Ratings":{"count":1,"avg":0},"Vehicle":{"vehicle_picture":null}},"Coupon":null,"Review":null,"CustomerAddress":{"id":327,"lat":13.9407362,"lng":100.5273484,"name":"114 Sukkhaprachasan 2","detail":"114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand","address":"114 Sukkhaprachasan 2"},"cost":155}

class WeRideActivityResponse {
  WeRideActivityResponse({
    this.message,
    this.result,
  });

  WeRideActivityResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? ActivityDetail.fromJson(json['result']) : null;
  }

  String? message;
  ActivityDetail? result;
}

/// id : 340
/// type : "RIDE"
/// total : "0"
/// status : "PROCESS"
/// user_id : 47
/// order_id : "WE1857D8F9391"
/// coupon_id : null
/// driver_id : 72
/// created_dt : "2023-01-04T16:13:59.571Z"
/// updated_dt : "2023-01-04T16:14:05.807Z"
/// merchant_id : null
/// driver_refuse : []
/// driver_of_area : [72]
/// payment_method : "CASH"
/// report_problem : null
/// customer_address_id : 327
/// payment_transection_id : null
/// Ride : {"cost":"200","note":null,"status":"ARRIVED","activity_id":340,"additional_cost":null,"vehicle_type_id":4,"Destinations":[{"destination_no":1,"address_id":431,"ride_activity_id":340,"Destination":{"id":431,"lat":13.9407362,"lng":100.5273484,"name":"114 Sukkhaprachasan 2","detail":"114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand","address":"114 Sukkhaprachasan 2"}}],"VehicleType":{"id":4,"name":"Motor Bike","cost":"200","picture":"https://welink.sgp1.cdn.digitaloceanspaces.com/dev/73ff74b5-7fd6-492c-984a-839e153625ec.png"},"Distance":{"km":13,"away_from_you":13,"time":{"hours":0,"minute":24}}}
/// User : {"id":47,"pin":"111111","name":"teerapong","picture":"dev/d4b08ce0-0c60-4f62-861d-5b3d70580c03.png","role":"CUSTOMER","email":"teerapongb.work@gmail.com","phone":"0804505845","birth":"2022-12-28T00:00:00.000Z","active":true,"gender":"MALE","status":"ACTIVE","lastname":"boonkwan","verifieds":["VERIFIED_OTP"],"device_token":"fgHUdOkuX01pmFpjv7LMQm:APA91bHZIrDfMDqOnD-pkIG3XVBVRBPkdMzqyQdx2Slq1WG7nUj3_EQmoThej9hDPAoCH_IRNI4vAvK7Cbi16qGg6ZQ5A_Bro3l69jylDxNKwBHZaO7qrGSqEoZoxHbvj6FBkW3mS5i6"}
/// Driver : {"id":72,"pin":"111111","name":"dickjay","picture":"dev/05c33bd9-11da-4a16-aecb-cbb38a3867f6.jpg","role":"DRIVER","email":"teerapong@gmail.com","phone":"0809999999","birth":"2022-12-29T00:00:00.000Z","active":false,"gender":"MALE","status":"INACTIVE","lastname":"boonkwan","verifieds":["VERIFIED_OTP"],"device_token":"c1aFQb55y0FJnPDPX4oucX:APA91bHbU_X2Nfb2yHHeHTRqIPS55uM0P4Vrz4zChoyimBtfvrvPwEjIweJixyfC5ihWULcIXcFL_2eJ-g4f4NdC5xUCIGi0qQMFU33gRf1-CymFiqOzX27i1YDUpxX_vfAQplpT2r0H","Ratings":{"count":1,"avg":0},"Vehicle":{"vehicle_picture":null}}
/// Coupon : null
/// Review : null
/// CustomerAddress : {"id":327,"lat":13.9407362,"lng":100.5273484,"name":"114 Sukkhaprachasan 2","detail":"114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand","address":"114 Sukkhaprachasan 2"}
/// cost : 155

class ActivityDetail {
  ActivityDetail({
    this.id,
    this.type,
    this.total,
    this.status,
    this.userId,
    this.orderId,
    this.couponId,
    this.driverId,
    this.createdDt,
    this.updatedDt,
    this.merchantId,
    this.driverOfArea,
    this.paymentMethod,
    this.reportProblem,
    this.customerAddressId,
    this.paymentTransectionId,
    this.ride,
    this.user,
    this.driver,
    this.coupon,
    this.review,
    this.customerAddress,
    this.points,
  });

  ActivityDetail.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    total = json['total'];
    status = json['status'];
    userId = json['user_id'];
    orderId = json['order_id'];
    couponId = json['coupon_id'];
    driverId = json['driver_id'];
    createdDt = json['created_dt'];
    updatedDt = json['updated_dt'];
    merchantId = json['merchant_id'];
    driverOfArea = json['driver_of_area'] != null
        ? json['driver_of_area'].cast<num>()
        : [];
    paymentMethod = json['payment_method'];
    reportProblem = json['report_problem'];
    customerAddressId = json['customer_address_id'];
    paymentTransectionId = json['payment_transection_id'];
    ride = json['Ride'] != null ? Ride.fromJson(json['Ride']) : null;
    driveYourCarResponse = json['DriveYourCar'] != null
        ? DriveYourCar.fromJson(json['DriveYourCar'])
        : null;
    weRentResponse = json['Rent'] != null
        ? Rent.fromJson(json['Rent'])
        : null;
    assistant = json['Assistant'] != null
        ? AssistantData.fromJson(json['Assistant'])
        : null;
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    driver = json['Driver'] != null ? Driver.fromJson(json['Driver']) : null;
    coupon = json['Coupon'] != null ? Coupon.fromJson(json['Coupon']) : null;
    activityReview = json['Review'] != null ? Review.fromJson(json['Review']) : null;
    review = json['Review'];
    customerAddress = json['CustomerAddress'] != null
        ? CustomerAddress.fromJson(json['CustomerAddress'])
        : null;
    points = json['points'];
  }

  num? id;
  String? type;
  String? total;
  String? status;
  num? userId;
  String? orderId;
  dynamic couponId;
  num? driverId;
  String? createdDt;
  String? updatedDt;
  dynamic merchantId;
  List<num>? driverOfArea;
  String? paymentMethod;
  dynamic reportProblem;
  num? customerAddressId;
  dynamic paymentTransectionId;
  Ride? ride;
  DriveYourCar? driveYourCarResponse;
  Rent? weRentResponse;
  AssistantData? assistant;
  User? user;
  Driver? driver;
  Coupon? coupon;
  Review? activityReview;
  dynamic review;
  CustomerAddress? customerAddress;
  num? points;
}

/// id : 327
/// lat : 13.9407362
/// lng : 100.5273484
/// name : "114 Sukkhaprachasan 2"
/// detail : "114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand"
/// address : "114 Sukkhaprachasan 2"

class CustomerAddress {
  CustomerAddress({
    this.id,
    this.lat,
    this.lng,
    this.name,
    this.detail,
    this.address,
  });

  CustomerAddress.fromJson(dynamic json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    detail = json['detail'];
    address = json['address'];
  }

  num? id;
  num? lat;
  num? lng;
  String? name;
  String? detail;
  String? address;
}

/// id : 72
/// pin : "111111"
/// name : "dickjay"
/// picture : "dev/05c33bd9-11da-4a16-aecb-cbb38a3867f6.jpg"
/// role : "DRIVER"
/// email : "teerapong@gmail.com"
/// phone : "0809999999"
/// birth : "2022-12-29T00:00:00.000Z"
/// active : false
/// gender : "MALE"
/// status : "INACTIVE"
/// lastname : "boonkwan"
/// verifieds : ["VERIFIED_OTP"]
/// device_token : "c1aFQb55y0FJnPDPX4oucX:APA91bHbU_X2Nfb2yHHeHTRqIPS55uM0P4Vrz4zChoyimBtfvrvPwEjIweJixyfC5ihWULcIXcFL_2eJ-g4f4NdC5xUCIGi0qQMFU33gRf1-CymFiqOzX27i1YDUpxX_vfAQplpT2r0H"
/// Ratings : {"count":1,"avg":0}
/// Vehicle : {"vehicle_picture":null}

class Driver {
  Driver({
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
    this.deviceToken,
    this.ratings,
    this.vehicle,
  });

  Driver.fromJson(dynamic json) {
    id = json['id'];
    pin = json['pin'];
    name = json['name'];
    picture = json['picture'];
    role = json['role'];
    email = json['email'];
    phone = json['phone'];
    birth = json['birth'];
    age = json['age'].toString();
    active = json['active'];
    gender = json['gender'];
    status = json['status'];
    lastname = json['lastname'];
    verifieds =
        json['verifieds'] != null ? json['verifieds'].cast<String>() : [];
    deviceToken = json['device_token'];
    ratings =
        json['Ratings'] != null ? Ratings.fromJson(json['Ratings']) : null;
    vehicle =
        json['Vehicle'] != null ? Vehicle.fromJson(json['Vehicle']) : null;
  }

  num? id;
  String? pin;
  String? name;
  String? picture;
  String? role;
  String? email;
  String? phone;
  String? birth, age;
  bool? active;
  String? gender;
  String? status;
  String? lastname;
  List<String>? verifieds;
  String? deviceToken;
  Ratings? ratings;
  Vehicle? vehicle;
}

/// vehicle_picture : null

class Vehicle {
  Vehicle({
    this.vehiclePicture,
  });

  Vehicle.fromJson(dynamic json) {
    id = json['id'];
    cardId = json['card_id'];
    modelId = json['model_id'];
    plateNo = json['plate_no'];
    driverId = json['driver_id'];
    vehiclePicture = json['vehiclePicture'];
  }

  num? id;
  String? cardId;
  num? modelId;
  String? plateNo;
  num? driverId;
  String? vehiclePicture;
}

/// count : 1
/// avg : 0

class Ratings {
  Ratings({
    this.count,
    this.avg,
  });

  Ratings.fromJson(dynamic json) {
    count = json['count'];
    avg = json['avg'];
  }

  num? count;
  num? avg;
}

/// id : 47
/// pin : "111111"
/// name : "teerapong"
/// picture : "dev/d4b08ce0-0c60-4f62-861d-5b3d70580c03.png"
/// role : "CUSTOMER"
/// email : "teerapongb.work@gmail.com"
/// phone : "0804505845"
/// birth : "2022-12-28T00:00:00.000Z"
/// active : true
/// gender : "MALE"
/// status : "ACTIVE"
/// lastname : "boonkwan"
/// verifieds : ["VERIFIED_OTP"]
/// device_token : "fgHUdOkuX01pmFpjv7LMQm:APA91bHZIrDfMDqOnD-pkIG3XVBVRBPkdMzqyQdx2Slq1WG7nUj3_EQmoThej9hDPAoCH_IRNI4vAvK7Cbi16qGg6ZQ5A_Bro3l69jylDxNKwBHZaO7qrGSqEoZoxHbvj6FBkW3mS5i6"

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
    this.deviceToken,
  });

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
    verifieds =
        json['verifieds'] != null ? json['verifieds'].cast<String>() : [];
    deviceToken = json['device_token'];
  }

  num? id;
  String? pin;
  String? name;
  String? picture;
  String? role;
  String? email;
  String? phone;
  String? birth;
  bool? active;
  String? gender;
  String? status;
  String? lastname;
  List<String>? verifieds;
  String? deviceToken;
}

/// cost : "200"
/// note : null
/// status : "ARRIVED"
/// activity_id : 340
/// additional_cost : null
/// vehicle_type_id : 4
/// Destinations : [{"destination_no":1,"address_id":431,"ride_activity_id":340,"Destination":{"id":431,"lat":13.9407362,"lng":100.5273484,"name":"114 Sukkhaprachasan 2","detail":"114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand","address":"114 Sukkhaprachasan 2"}}]
/// VehicleType : {"id":4,"name":"Motor Bike","cost":"200","picture":"https://welink.sgp1.cdn.digitaloceanspaces.com/dev/73ff74b5-7fd6-492c-984a-839e153625ec.png"}
/// Distance : {"km":13,"away_from_you":13,"time":{"hours":0,"minute":24}}

class Ride {
  Ride({
    this.cost,
    this.note,
    this.status,
    this.activityId,
    this.additionalCost,
    this.vehicleTypeId,
    this.destinations,
    this.vehicleType,
    this.distance,
  });

  Ride.fromJson(dynamic json) {
    cost = json['cost'];
    note = json['note'];
    status = json['status'];
    activityId = json['activity_id'];
    additionalCost = json['additional_cost'];
    vehicleTypeId = json['vehicle_type_id'];
    if (json['Destinations'] != null) {
      destinations = [];
      json['Destinations'].forEach((v) {
        destinations?.add(Destinations.fromJson(v));
      });
    }
    vehicleType = json['VehicleType'] != null
        ? VehicleType.fromJson(json['VehicleType'])
        : null;
    distance =
        json['Distance'] != null ? Distance.fromJson(json['Distance']) : null;
  }

  String? cost;
  dynamic note;
  String? status;
  num? activityId;
  dynamic additionalCost;
  num? vehicleTypeId;
  List<Destinations>? destinations;
  VehicleType? vehicleType;
  Distance? distance;
}

/// km : 13
/// away_from_you : 13
/// time : {"hours":0,"minute":24}

class Distance {
  Distance({
    this.km,
    this.awayFromYou,
    this.time,
  });

  Distance.fromJson(dynamic json) {
    km = json['km'];
    awayFromYou = json['away_from_you'];
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
  }

  num? km;
  num? awayFromYou;
  Time? time;
}

/// hours : 0
/// minute : 24

class Time {
  Time({
    this.hours,
    this.minute,
  });

  Time.fromJson(dynamic json) {
    hours = json['hours'];
    minute = json['minute'];
  }

  num? hours;
  num? minute;
}

/// id : 4
/// name : "Motor Bike"
/// cost : "200"
/// picture : "https://welink.sgp1.cdn.digitaloceanspaces.com/dev/73ff74b5-7fd6-492c-984a-839e153625ec.png"

class VehicleType {
  VehicleType({
    this.id,
    this.name,
    this.cost,
    this.picture,
  });

  VehicleType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    cost = json['cost'];
    picture = json['picture'];
  }

  num? id;
  String? name;
  String? cost;
  String? picture;
}

/// destination_no : 1
/// address_id : 431
/// ride_activity_id : 340
/// Destination : {"id":431,"lat":13.9407362,"lng":100.5273484,"name":"114 Sukkhaprachasan 2","detail":"114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand","address":"114 Sukkhaprachasan 2"}

class Destinations {
  Destinations({
    this.destinationNo,
    this.addressId,
    this.rideActivityId,
    this.destination,
  });

  Destinations.fromJson(dynamic json) {
    destinationNo = json['destination_no'];
    addressId = json['address_id'];
    rideActivityId = json['ride_activity_id'];
    destination = json['Destination'] != null
        ? Destination.fromJson(json['Destination'])
        : null;
  }

  num? destinationNo;
  num? addressId;
  num? rideActivityId;
  Destination? destination;
}

/// id : 431
/// lat : 13.9407362
/// lng : 100.5273484
/// name : "114 Sukkhaprachasan 2"
/// detail : "114 Sukkhaprachasan 2, Tambon Ban Mai, Amphoe Pak Kret, Chang Wat Nonthaburi 11120, Thailand"
/// address : "114 Sukkhaprachasan 2"

class Destination {
  Destination({
    this.id,
    this.lat,
    this.lng,
    this.name,
    this.detail,
    this.icon,
    this.address,
  });

  Destination.fromJson(dynamic json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    detail = json['detail'];
    address = json['address'];
  }

  num? id;
  num? lat;
  num? lng;
  String? name;
  String? detail;
  String? address;
  String? icon;
}

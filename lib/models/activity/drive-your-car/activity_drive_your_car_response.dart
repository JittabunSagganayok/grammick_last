import 'dart:convert';

import '../we-ride/we_ride_activity_response.dart';

/// DriveYourCar : {"car":"civic","cost":"281.74","status":"WAITING","activity_id":492,"drive_system":"AUTO","additional_cost":null,"destination_address_id":749,"Destination":{"id":749,"lat":13.937932,"lng":100.547135,"name":"สถานีตำรวจภูธรปากเกร็ด","detail":"13/13 หมู่ 3, ถนนศรีสมาน (opp Horwang School), ปากเกร็ด, Nonthaburi 11120","address":"สถานีตำรวจภูธรปากเกร็ด"},"Distance":{"km":25,"away_from_you":0,"time":{"hours":0,"minute":25}}}
class ActivityDriveYourCarResponse {
  ActivityDriveYourCarResponse({
    this.driveYourCar,
  });

  ActivityDriveYourCarResponse.fromJson(dynamic json) {
    driveYourCar = json['DriveYourCar'] != null
        ? DriveYourCar.fromJson(json['DriveYourCar'])
        : null;
  }

  DriveYourCar? driveYourCar;

  ActivityDriveYourCarResponse copyWith({
    DriveYourCar? driveYourCar,
  }) =>
      ActivityDriveYourCarResponse(
        driveYourCar: driveYourCar ?? this.driveYourCar,
      );
}

/// car : "civic"
/// cost : "281.74"
/// status : "WAITING"
/// activity_id : 492
/// drive_system : "AUTO"
/// additional_cost : null
/// destination_address_id : 749
/// Destination : {"id":749,"lat":13.937932,"lng":100.547135,"name":"สถานีตำรวจภูธรปากเกร็ด","detail":"13/13 หมู่ 3, ถนนศรีสมาน (opp Horwang School), ปากเกร็ด, Nonthaburi 11120","address":"สถานีตำรวจภูธรปากเกร็ด"}
/// Distance : {"km":25,"away_from_you":0,"time":{"hours":0,"minute":25}}

class DriveYourCar {
  DriveYourCar({
    this.car,
    this.cost,
    this.status,
    this.activityId,
    this.driveSystem,
    this.additionalCost,
    this.destinationAddressId,
    this.destination,
    this.distance,
  });

  DriveYourCar.fromJson(dynamic json) {
    car = json['car'];
    more = json['more'];
    cost = json['cost'];
    status = json['status'];
    activityId = json['activity_id'];
    driveSystem = json['drive_system'];
    additionalCost = json['additional_cost'];
    destinationAddressId = json['destination_address_id'];
    destination = json['Destination'] != null
        ? Destination.fromJson(json['Destination'])
        : null;
    distance =
        json['Distance'] != null ? Distance.fromJson(json['Distance']) : null;
  }

  String? car,more;
  String? cost;
  String? status;
  num? activityId;
  String? driveSystem;
  dynamic additionalCost;
  num? destinationAddressId;
  Destination? destination;
  Distance? distance;

  DriveYourCar copyWith({
    String? car,
    String? cost,
    String? status,
    num? activityId,
    String? driveSystem,
    dynamic additionalCost,
    num? destinationAddressId,
    Destination? destination,
    Distance? distance,
  }) =>
      DriveYourCar(
        car: car ?? this.car,
        cost: cost ?? this.cost,
        status: status ?? this.status,
        activityId: activityId ?? this.activityId,
        driveSystem: driveSystem ?? this.driveSystem,
        additionalCost: additionalCost ?? this.additionalCost,
        destinationAddressId: destinationAddressId ?? this.destinationAddressId,
        destination: destination ?? this.destination,
        distance: distance ?? this.distance,
      );
}

/// id : 749
/// lat : 13.937932
/// lng : 100.547135
/// name : "สถานีตำรวจภูธรปากเกร็ด"
/// detail : "13/13 หมู่ 3, ถนนศรีสมาน (opp Horwang School), ปากเกร็ด, Nonthaburi 11120"
/// address : "สถานีตำรวจภูธรปากเกร็ด"
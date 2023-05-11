import 'we-ride/we_ride_activity_response.dart';

/// Rent : {"fuel":false,"plan":"the mall","cost":"700","note":null,"house":3,"status":"SUCCESS","use_packet":true,"activity_id":537,"additional_cost":null,"vehicle_type_id":null,"vehicle_packet_id":1,"VehicleType":null,"VehiclePacket":{"id":1,"fuel":false,"price":"900","house":3,"title":"Package 01","detail":null,"promotion_price":"700"},"Distance":{"km":0,"away_from_you":0,"time":{"hours":0,"minute":0}}}

class ActivityWeRentResponse {
  ActivityWeRentResponse({
      this.rent,});

  ActivityWeRentResponse.fromJson(dynamic json) {
    rent = json['Rent'] != null ? Rent.fromJson(json['Rent']) : null;
  }
  Rent? rent;

}

/// fuel : false
/// plan : "the mall"
/// cost : "700"
/// note : null
/// house : 3
/// status : "SUCCESS"
/// use_packet : true
/// activity_id : 537
/// additional_cost : null
/// vehicle_type_id : null
/// vehicle_packet_id : 1
/// VehicleType : null
/// VehiclePacket : {"id":1,"fuel":false,"price":"900","house":3,"title":"Package 01","detail":null,"promotion_price":"700"}
/// Distance : {"km":0,"away_from_you":0,"time":{"hours":0,"minute":0}}

class Rent {
  Rent({
      this.fuel, 
      this.plan, 
      this.cost, 
      this.note, 
      this.house, 
      this.status, 
      this.usePacket, 
      this.activityId, 
      this.additionalCost, 
      this.vehicleTypeId, 
      this.vehiclePacketId, 
      this.vehicleType, 
      this.vehiclePacket, 
      this.distance,});

  Rent.fromJson(dynamic json) {
    fuel = json['fuel'];
    plan = json['plan'];
    cost = json['cost'];
    note = json['note'];
    house = json['house'];
    status = json['status'];
    usePacket = json['use_packet'];
    activityId = json['activity_id'];
    additionalCost = json['additional_cost'];
    vehicleTypeId = json['vehicle_type_id'];
    vehiclePacketId = json['vehicle_packet_id'];
    vehicleType = json['VehicleType'] != null ? VehicleType.fromJson(json['VehicleType']) : null;
    vehiclePacket = json['VehiclePacket'] != null ? VehiclePacket.fromJson(json['VehiclePacket']) : null;
    distance = json['Distance'] != null ? Distance.fromJson(json['Distance']) : null;
  }
  bool? fuel;
  String? plan;
  String? cost;
  String? note;
  num? house;
  String? status;
  bool? usePacket;
  num? activityId;
  dynamic additionalCost;
  dynamic vehicleTypeId;
  num? vehiclePacketId;
  VehicleType? vehicleType;
  VehiclePacket? vehiclePacket;
  Distance? distance;
}

/// id : 1
/// fuel : false
/// price : "900"
/// house : 3
/// title : "Package 01"
/// detail : null
/// promotion_price : "700"

class VehiclePacket {
  VehiclePacket({
      this.id, 
      this.fuel, 
      this.price, 
      this.house, 
      this.title, 
      this.detail, 
      this.promotionPrice,});

  VehiclePacket.fromJson(dynamic json) {
    id = json['id'];
    fuel = json['fuel'];
    price = json['price'];
    house = json['house'];
    title = json['title'];
    detail = json['detail'];
    picture = json['picture'];
    promotionPrice = json['promotion_price'];
  }
  num? id;
  bool? fuel;
  String? price;
  num? house;
  String? title,picture;
  dynamic detail;
  String? promotionPrice;
}
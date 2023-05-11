import 'dart:convert';

/// message : "success"
/// result : [{"id":1,"price":"900","house":3,"title":"รถเช่า 1","detail":null,"promotion_price":"400","vehicle_packet_vehicle_types":[{"vehicle_packet_id":1,"vehicle_type_id":1,"VehicleType":{"id":1,"name":"Regular","picture":null}}]}]

VehiclePromotionListResponse vehiclePromotionListResponseFromJson(String str) =>
    VehiclePromotionListResponse.fromJson(json.decode(str));

String vehiclePromotionListResponseToJson(VehiclePromotionListResponse data) =>
    json.encode(data.toJson());

class VehiclePromotionListResponse {
  VehiclePromotionListResponse({
    this.message,
    this.result,
  });

  VehiclePromotionListResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(VehiclePromotion.fromJson(v));
      });
    }
  }

  String? message;
  List<VehiclePromotion>? result;

  VehiclePromotionListResponse copyWith({
    String? message,
    List<VehiclePromotion>? result,
  }) =>
      VehiclePromotionListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// price : "900"
/// house : 3
/// title : "รถเช่า 1"
/// detail : null
/// promotion_price : "400"
/// vehicle_packet_vehicle_types : [{"vehicle_packet_id":1,"vehicle_type_id":1,"VehicleType":{"id":1,"name":"Regular","picture":null}}]

VehiclePromotion resultFromJson(String str) =>
    VehiclePromotion.fromJson(json.decode(str));

String resultToJson(VehiclePromotion data) => json.encode(data.toJson());

class VehiclePromotion {
  VehiclePromotion({
    this.id,
    this.price,
    this.house,
    this.title,
    this.detail,
    this.promotionPrice,
    this.vehiclePacketVehicleTypes,
  });

  VehiclePromotion.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    house = json['house'];
    title = json['title'];
    detail = json['detail'];
    picture = json['picture'];
    promotionPrice = json['promotion_price'];
    if (json['VehiclePacketVehicleTypes'] != null) {
      vehiclePacketVehicleTypes = [];
      json['VehiclePacketVehicleTypes'].forEach((v) {
        vehiclePacketVehicleTypes?.add(VehiclePacketVehicleTypes.fromJson(v));
      });
    }
  }

  int? id;
  String? price, picture;
  int? house;
  String? title;
  dynamic detail;
  String? promotionPrice;
  List<VehiclePacketVehicleTypes>? vehiclePacketVehicleTypes;

  VehiclePromotion copyWith({
    int? id,
    String? price,
    int? house,
    String? title,
    dynamic detail,
    String? promotionPrice,
    List<VehiclePacketVehicleTypes>? vehiclePacketVehicleTypes,
  }) =>
      VehiclePromotion(
        id: id ?? this.id,
        price: price ?? this.price,
        house: house ?? this.house,
        title: title ?? this.title,
        detail: detail ?? this.detail,
        promotionPrice: promotionPrice ?? this.promotionPrice,
        vehiclePacketVehicleTypes:
            vehiclePacketVehicleTypes ?? this.vehiclePacketVehicleTypes,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['house'] = house;
    map['title'] = title;
    map['detail'] = detail;
    map['promotion_price'] = promotionPrice;
    if (vehiclePacketVehicleTypes != null) {
      map['vehicle_packet_vehicle_types'] =
          vehiclePacketVehicleTypes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// vehicle_packet_id : 1
/// vehicle_type_id : 1
/// VehicleType : {"id":1,"name":"Regular","picture":null}

VehiclePacketVehicleTypes vehiclePacketVehicleTypesFromJson(String str) =>
    VehiclePacketVehicleTypes.fromJson(json.decode(str));

String vehiclePacketVehicleTypesToJson(VehiclePacketVehicleTypes data) =>
    json.encode(data.toJson());

class VehiclePacketVehicleTypes {
  VehiclePacketVehicleTypes({
    this.vehiclePacketId,
    this.vehicleTypeId,
    this.vehicleType,
  });

  VehiclePacketVehicleTypes.fromJson(dynamic json) {
    vehiclePacketId = json['vehicle_packet_id'];
    vehicleTypeId = json['vehicle_type_id'];
    vehicleType = json['VehicleType'] != null
        ? VehicleType.fromJson(json['VehicleType'])
        : null;
  }

  int? vehiclePacketId;
  int? vehicleTypeId;
  VehicleType? vehicleType;

  VehiclePacketVehicleTypes copyWith({
    int? vehiclePacketId,
    int? vehicleTypeId,
    VehicleType? vehicleType,
  }) =>
      VehiclePacketVehicleTypes(
        vehiclePacketId: vehiclePacketId ?? this.vehiclePacketId,
        vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
        vehicleType: vehicleType ?? this.vehicleType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicle_packet_id'] = vehiclePacketId;
    map['vehicle_type_id'] = vehicleTypeId;
    if (vehicleType != null) {
      map['VehicleType'] = vehicleType?.toJson();
    }
    return map;
  }
}

/// id : 1
/// name : "Regular"
/// picture : null

VehicleType vehicleTypeFromJson(String str) =>
    VehicleType.fromJson(json.decode(str));

String vehicleTypeToJson(VehicleType data) => json.encode(data.toJson());

class VehicleType {
  VehicleType({
    this.id,
    this.name,
    this.picture,
  });

  VehicleType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
  }

  int? id;
  String? name;
  dynamic picture;

  VehicleType copyWith({
    int? id,
    String? name,
    dynamic picture,
  }) =>
      VehicleType(
        id: id ?? this.id,
        name: name ?? this.name,
        picture: picture ?? this.picture,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['picture'] = picture;
    return map;
  }
}

import 'dart:convert';

/// order_id : "00110011"
/// coupon_id : null
/// payment_method : "CASH"
/// Ride : {"cost":100,"more":null,"vehicle_type_id":1,"Destinations":[{"destination_no":1,"address_id":7}]}

CreateWeRideOrderRequest createWeRideOrderRequestFromJson(String str) =>
    CreateWeRideOrderRequest.fromJson(json.decode(str));

String createWeRideOrderRequestToJson(CreateWeRideOrderRequest data) =>
    json.encode(data.toJson());

class CreateWeRideOrderRequest {
  CreateWeRideOrderRequest({
    this.couponId,
    this.paymentMethod,
    this.paymentTransactionId,
    this.customerPoint,
    this.ride,
    this.driveYourCar,
    this.weRent,
    this.createdAt,
  });

  CreateWeRideOrderRequest.fromJson(dynamic json) {
    couponId = json['coupon_id'];
    paymentMethod = json['payment_method'];
    customerPoint = json['CustomerPoint'] != null
        ? CustomerPoint.fromJson(json['CustomerPoint'])
        : null;
    ride = json['Ride'] != null ? Ride.fromJson(json['Ride']) : null;
  }

  num? couponId;
  String? createdAt;
  String? paymentMethod;
  String? paymentTransactionId;
  Ride? ride;
  DriveYourCar? driveYourCar;
  Rent? weRent;
  CustomerPoint? customerPoint;

  CreateWeRideOrderRequest copyWith({
    String? orderId,
    dynamic couponId,
    String? paymentMethod,
    Ride? ride,
    CustomerPoint? customerPoint,
  }) =>
      CreateWeRideOrderRequest(
        couponId: couponId ?? this.couponId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        ride: ride ?? this.ride,
        customerPoint: customerPoint ?? this.customerPoint,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coupon_id'] = couponId;
    map['payment_method'] = paymentMethod;
    map['payment_transection_id'] = paymentTransactionId;

    if (createdAt != null) {
      map['created_dt'] = createdAt;
    }
    if (ride != null) {
      map['Ride'] = ride?.toJson();
    }
    if (driveYourCar != null) {
      map['DriveYourCar'] = driveYourCar?.toJson();
    }
    if (weRent != null) {
      map['Rent'] = weRent?.toJson();
    }
    if (customerPoint != null) {
      map['CustomerPoint'] = customerPoint?.toJson();
    }
    return map;
  }
}

/// cost : 100
/// more : null
/// vehicle_type_id : 1
/// Destinations : [{"destination_no":1,"address_id":7}]

Ride rideFromJson(String str) => Ride.fromJson(json.decode(str));

String rideToJson(Ride data) => json.encode(data.toJson());

class Ride {
  Ride({
    this.cost,
    this.note,
    this.vehicleTypeId,
    this.destinations,
  });

  Ride.fromJson(dynamic json) {
    cost = json['cost'];
    note = json['note'];
    vehicleTypeId = json['vehicle_type_id'];
    if (json['Destinations'] != null) {
      destinations = [];
      json['Destinations'].forEach((v) {
        destinations?.add(Destinations.fromJson(v));
      });
    }
  }

  num? cost;
  String? note;
  int? vehicleTypeId;
  List<Destinations>? destinations;

  Ride copyWith({
    int? cost,
    dynamic more,
    int? vehicleTypeId,
    List<Destinations>? destinations,
  }) =>
      Ride(
        cost: cost ?? this.cost,
        note: more ?? this.note,
        vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
        destinations: destinations ?? this.destinations,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cost'] = cost;
    map['note'] = note;
    map['vehicle_type_id'] = vehicleTypeId;
    if (destinations != null) {
      map['Destinations'] = destinations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DriveYourCar {
  num? destinationAddressId;
  String? driveSystem;
  String? car;
  num? cost;
  String? more;

  DriveYourCar({
    this.destinationAddressId,
    this.driveSystem,
    this.car,
    this.cost,
    this.more,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['destination_address_id'] = destinationAddressId;
    map['drive_system'] = driveSystem?.toUpperCase().toString();
    map['car'] = car;
    map['cost'] = cost;

    if (more != null) {
      map['more'] = more;
    }

    return map;
  }
}

class Rent {
  String? plan;
  String? rentHousing;
  num? packageId;
  num? vehicleTypeId;
  num? cost;

  Rent({
    this.plan,
    this.rentHousing,
    this.packageId,
    this.vehicleTypeId,
    this.cost,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plan'] = plan;

    if (packageId != null) {
      map['vehicle_packet_id'] = packageId;
    }

    if (vehicleTypeId != 0) {
      if (rentHousing != null && rentHousing != "0") {
        map['house'] = num.tryParse(rentHousing ?? "0") ?? 0;
      }
      map['vehicle_type_id'] = vehicleTypeId;
      map['cost'] = 1;
    }
    return map;
  }
}

/// destination_no : 1
/// address_id : 7

Destinations destinationsFromJson(String str) =>
    Destinations.fromJson(json.decode(str));

String destinationsToJson(Destinations data) => json.encode(data.toJson());

class Destinations {
  Destinations({
    this.destinationNo,
    this.addressId,
  });

  Destinations.fromJson(dynamic json) {
    destinationNo = json['destination_no'];
    addressId = json['address_id'];
  }

  int? destinationNo;
  int? addressId;

  Destinations copyWith({
    int? destinationNo,
    int? addressId,
  }) =>
      Destinations(
        destinationNo: destinationNo ?? this.destinationNo,
        addressId: addressId ?? this.addressId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['destination_no'] = destinationNo;
    map['address_id'] = addressId;
    return map;
  }
}

class CustomerPoint {
  CustomerPoint({
    this.lat,
    this.lng,
    this.name,
    this.address,
    this.detail,
  });

  CustomerPoint.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  double? lat;
  double? lng;
  String? name, address, detail;

  CustomerPoint copyWith({
    double? lat,
    double? lng,
  }) =>
      CustomerPoint(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['address'] = address;
    map['detail'] = detail;
    return map;
  }
}

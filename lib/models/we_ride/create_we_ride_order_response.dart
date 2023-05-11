import 'dart:convert';

/// message : "success"
/// result : {"id":74,"type":"RIDE","user_id":47,"order_id":"WE183D21F78B12","status":"PENDING"}

class CreateWeRideOrderResponse {
  CreateWeRideOrderResponse({
    this.message,
    this.result,
  });

  CreateWeRideOrderResponse.fromJson(dynamic json) {
    message = json['message'];
    result =
        json['result'] != null ? OrderDetail.fromJson(json['result']) : null;
  }

  String? message;
  OrderDetail? result;
}

/// id : 74
/// type : "RIDE"
/// user_id : 47
/// order_id : "WE183D21F78B12"
/// status : "PENDING"

class OrderDetail {
  OrderDetail({
    this.id,
    this.driverId,
  });

  OrderDetail.fromJson(dynamic json) {
    id = json['id'];
  }

  int? id;
  num? driverId;
}

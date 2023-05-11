import 'dart:convert';

import '../../../models/we_ride/create_we_ride_order_request.dart';

/// coupon_id : null
/// payment_method : "CASH"
/// payment_transection_id : null
/// CustomerPoint : {"lat":13.9075604,"lng":100.5328044}
/// Assistant : {"note":"<p> hi </p>","estimate_price":10.0,"additional_cost":40,"recipient_name":"Mr.ar","recipient_phone":"0800000000","type":"FIX","category_id":1,"address_id":41,"items":[{"price":3,"piece":3,"name":"รองเท้า"}]}

CreateAssistantOrderRequest createAssistantOrderRequestFromJson(String str) =>
    CreateAssistantOrderRequest.fromJson(json.decode(str));

String createAssistantOrderRequestToJson(CreateAssistantOrderRequest data) =>
    json.encode(data.toJson());

class CreateAssistantOrderRequest {
  CreateAssistantOrderRequest({
    this.couponId,
    this.paymentMethod,
    this.paymentTransectionId,
    this.customerPoint,
    this.assistant,
  });

  CreateAssistantOrderRequest.fromJson(dynamic json) {
    couponId = json['coupon_id'];
    paymentMethod = json['payment_method'];
    paymentTransectionId = json['payment_transection_id'];
    customerPoint = json['CustomerPoint'] != null
        ? CustomerPoint.fromJson(json['CustomerPoint'])
        : null;
    assistant = json['Assistant'] != null
        ? Assistant.fromJson(json['Assistant'])
        : null;
  }

  dynamic couponId;
  String? paymentMethod;
  dynamic paymentTransectionId;
  CustomerPoint? customerPoint;
  Assistant? assistant;

  CreateAssistantOrderRequest copyWith({
    dynamic couponId,
    String? paymentMethod,
    dynamic paymentTransectionId,
    CustomerPoint? customerPoint,
    Assistant? assistant,
  }) =>
      CreateAssistantOrderRequest(
        couponId: couponId ?? this.couponId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentTransectionId: paymentTransectionId ?? this.paymentTransectionId,
        customerPoint: customerPoint ?? this.customerPoint,
        assistant: assistant ?? this.assistant,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coupon_id'] = couponId;
    map['payment_method'] = paymentMethod;
    map['payment_transection_id'] = paymentTransectionId;
    if (customerPoint != null) {
      map['CustomerPoint'] = customerPoint?.toJson();
    }
    if (assistant != null) {
      map['Assistant'] = assistant?.toJson();
    }
    return map;
  }
}

/// note : "<p> hi </p>"
/// estimate_price : 10.0
/// additional_cost : 40
/// recipient_name : "Mr.ar"
/// recipient_phone : "0800000000"
/// type : "FIX"
/// category_id : 1
/// address_id : 41
/// items : [{"price":3,"piece":3,"name":"รองเท้า"}]

Assistant assistantFromJson(String str) => Assistant.fromJson(json.decode(str));

String assistantToJson(Assistant data) => json.encode(data.toJson());

class Assistant {
  Assistant({
    this.note,
    this.estimatePrice,
    this.estimateTime,
    this.additionalCost,
    this.recipientName,
    this.recipientPhone,
    this.type,
    this.categoryId,
    this.cost,
    this.addressId,
    this.pictures,
    this.items,
  });

  Assistant.fromJson(dynamic json) {
    note = json['note'];
    estimatePrice = json['estimate_price'];
    additionalCost = json['additional_cost'];
    recipientName = json['recipient_name'];
    recipientPhone = json['recipient_phone'];
    type = json['type'];
    categoryId = json['category_id'];
    addressId = json['address_id'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }

  String? note;
  num? cost;
  num? estimatePrice;
  num? estimateTime;
  num? additionalCost;
  String? recipientName;
  String? recipientPhone;
  String? type;
  num? categoryId;
  num? addressId;
  List<Items>? items;
  List<String>? pictures;

  Assistant copyWith({
    String? note,
    num? estimatePrice,
    num? additionalCost,
    String? recipientName,
    String? recipientPhone,
    String? type,
    num? categoryId,
    num? addressId,
    List<Items>? items,
  }) =>
      Assistant(
        note: note ?? this.note,
        estimatePrice: estimatePrice ?? this.estimatePrice,
        additionalCost: additionalCost ?? this.additionalCost,
        recipientName: recipientName ?? this.recipientName,
        recipientPhone: recipientPhone ?? this.recipientPhone,
        type: type ?? this.type,
        categoryId: categoryId ?? this.categoryId,
        addressId: addressId ?? this.addressId,
        items: items ?? this.items,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['note'] = note;
    map['cost'] = cost;
    map['estimate_price'] = estimatePrice;
    map['estimate_time'] = estimateTime;
    map['additional_cost'] = additionalCost;
    map['recipient_name'] = recipientName;
    map['recipient_phone'] = recipientPhone;
    map['type'] = type;
    map['category_id'] = categoryId;
    map['address_id'] = addressId;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    if (pictures != null && pictures?.isNotEmpty == true) {
      map['pictures'] = pictures;
    }
    return map;
  }
}

/// price : 3
/// piece : 3
/// name : "รองเท้า"

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    this.price,
    this.piece,
    this.name,
  });

  Items.fromJson(dynamic json) {
    price = json['price'];
    piece = json['piece'];
    name = json['name'];
  }

  num? price;
  num? piece;
  String? name;

  Items copyWith({
    num? price,
    num? piece,
    String? name,
  }) =>
      Items(
        price: price ?? this.price,
        piece: piece ?? this.piece,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['piece'] = piece;
    map['name'] = name;
    return map;
  }
}




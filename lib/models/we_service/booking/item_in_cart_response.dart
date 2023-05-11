import 'item_booking_response.dart';

/// (ใช้ class จาก item_booking_response)
/// item_option_data  (ItemOptionData)
/// optional (Optional)

class ItemInCartResponse {
  String? status;
  String? message;
  ItemInCartData? data;

  ItemInCartResponse({this.status, this.message, this.data});

  ItemInCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ItemInCartData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ItemInCartData {
  CartData? cartData;
  List<ItemData>? itemData;

  ItemInCartData({this.cartData, this.itemData});

  ItemInCartData.fromJson(Map<String, dynamic> json) {
    cartData =
        json['cart_data'] != null ? CartData.fromJson(json['cart_data']) : null;
    if (json['item_data'] != null) {
      itemData = <ItemData>[];
      json['item_data'].forEach((v) {
        itemData!.add(ItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cartData != null) {
      data['cart_data'] = cartData!.toJson();
    }
    if (itemData != null) {
      data['item_data'] = itemData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartData {
  int? bookingId;
  int? userId;
  int? merchantId;
  int? zoneId;
  int? tableId;
  String? tableName;
  String? reservationDate;
  int? people;
  String? subtotal;
  String? total;

  CartData(
      {this.bookingId,
      this.userId,
      this.merchantId,
      this.zoneId,
      this.tableId,
      this.tableName,
      this.reservationDate,
      this.people,
      this.subtotal,
      this.total});

  CartData.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    userId = json['user_id'];
    merchantId = json['merchant_id'];
    zoneId = json['zone_id'];
    tableId = json['table_id'];
    tableName = json['table_name'];
    reservationDate = json['reservation_date'];
    people = json['people'];
    subtotal = json['subtotal'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['user_id'] = userId;
    data['merchant_id'] = merchantId;
    data['zone_id'] = zoneId;
    data['table_id'] = tableId;
    data['table_name'] = tableName;
    data['reservation_date'] = reservationDate;
    data['people'] = people;
    data['subtotal'] = subtotal;
    data['total'] = total;
    return data;
  }
}

class ItemData {
  int? id;
  int? bookingId;
  int? itemId;
  String? image;
  String? name;
  String? description;
  String? price;
  int? quantity;
  String? optionalPrice;
  String? discount;
  String? total;
  String? note;
  String? createdAt;
  String? updatedAt;
  List<ItemOptionData>? itemOptionData;

  ItemData(
      {this.id,
      this.bookingId,
      this.itemId,
      this.image,
      this.name,
      this.description,
      this.price,
      this.quantity,
      this.optionalPrice,
      this.discount,
      this.total,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.itemOptionData});

  ItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    itemId = json['item_id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    optionalPrice = json['optional_price'];
    discount = json['discount'];
    total = json['total'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['item_option_data'] != null) {
      itemOptionData = <ItemOptionData>[];
      json['item_option_data'].forEach((v) {
        itemOptionData!.add(ItemOptionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['item_id'] = itemId;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['quantity'] = quantity;
    data['optional_price'] = optionalPrice;
    data['discount'] = discount;
    data['total'] = total;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (itemOptionData != null) {
      data['item_option_data'] =
          itemOptionData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemBookingResponse {
  String? status;
  String? message;
  List<ItemBookingData>? data;

  ItemBookingResponse({this.status, this.message, this.data});

  ItemBookingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ItemBookingData>[];
      json['data'].forEach((v) {
        data!.add(ItemBookingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemIdBookingResponse {
  String? status;
  String? message;
  ItemBookingData? data;

  ItemIdBookingResponse({this.status, this.message, this.data});

  ItemIdBookingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ItemBookingData.fromJson(json['data']) : null;
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

class ItemBookingData {
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

  ItemBookingData(
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

  ItemBookingData.fromJson(Map<String, dynamic> json) {
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

class ItemOptionData {
  int? id;
  int? optionId;
  String? name;
  List<Optional>? optional;

  ItemOptionData({this.id, this.optionId, this.name, this.optional});

  ItemOptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    optionId = json['option_id'];
    name = json['name'];
    if (json['optional'] != null) {
      optional = <Optional>[];
      json['optional'].forEach((v) {
        optional!.add(Optional.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['option_id'] = optionId;
    data['name'] = name;
    if (optional != null) {
      data['optional'] = optional!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Optional {
  int? id;
  String? name;
  String? price;

  Optional({this.id, this.name, this.price});

  Optional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price.toString();
    return data;
  }
}

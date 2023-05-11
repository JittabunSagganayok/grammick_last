class BookingResponse {
  String? status;
  String? message;
  List<BookingData>? data;

  BookingResponse({this.status, this.message, this.data});

  BookingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BookingData>[];
      json['data'].forEach((v) {
        data!.add(BookingData.fromJson(v));
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

class BookingIdResponse {
  String? status;
  String? message;
  BookingData? data;

  BookingIdResponse({this.status, this.message, this.data});

  BookingIdResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? BookingData.fromJson(json['data']) : null;
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

class BookingData {
  int? id;
  int? userId;
  int? merchantId;
  int? activityId;
  int? zoneId;
  int? tableId;
  String? merchantType;
  String? bookingCode;
  String? tableName;
  String? reservationDate;
  int? people;
  String? subtotal;
  String? discount;
  String? total;
  String? gp;
  String? vat;
  String? cancelMessage;
  String? cancelBy;
  String? status;
  String? placedAt;
  String? confirmedAt;
  String? cancelledAt;
  String? arrivedAt;
  String? succeededAt;
  String? createdAt;
  String? updatedAt;
  MerchantData? merchantData;

  BookingData(
      {this.id,
      this.userId,
      this.merchantId,
      this.activityId,
      this.zoneId,
      this.tableId,
      this.merchantType,
      this.bookingCode,
      this.tableName,
      this.reservationDate,
      this.people,
      this.subtotal,
      this.discount,
      this.total,
      this.gp,
      this.vat,
      this.cancelMessage,
      this.cancelBy,
      this.status,
      this.placedAt,
      this.confirmedAt,
      this.cancelledAt,
      this.arrivedAt,
      this.succeededAt,
      this.createdAt,
      this.updatedAt,
      this.merchantData});

  BookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    merchantId = json['merchant_id'];
    activityId = json['activity_id'];
    zoneId = json['zone_id'];
    tableId = json['table_id'];
    merchantType = json['merchant_type'];
    bookingCode = json['booking_code'];
    tableName = json['table_name'];
    reservationDate = json['reservation_date'];
    people = json['people'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    total = json['total'];
    gp = json['gp'];
    vat = json['vat'];
    cancelMessage = json['cancel_message'];
    cancelBy = json['cancel_by'];
    status = json['status'];
    placedAt = json['placed_at'];
    confirmedAt = json['confirmed_at'];
    cancelledAt = json['cancelled_at'];
    arrivedAt = json['arrived_at'];
    succeededAt = json['succeeded_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    merchantData = json['merchant_data'] != null
        ? MerchantData.fromJson(json['merchant_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['merchant_id'] = merchantId;
    data['activity_id'] = activityId;
    data['zone_id'] = zoneId;
    data['table_id'] = tableId;
    data['merchant_type'] = merchantType;
    data['booking_code'] = bookingCode;
    data['table_name'] = tableName;
    data['reservation_date'] = reservationDate;
    data['people'] = people;
    data['subtotal'] = subtotal;
    data['discount'] = discount;
    data['total'] = total;
    data['gp'] = gp;
    data['vat'] = vat;
    data['cancel_message'] = cancelMessage;
    data['cancel_by'] = cancelBy;
    data['status'] = status;
    data['placed_at'] = placedAt;
    data['confirmed_at'] = confirmedAt;
    data['cancelled_at'] = cancelledAt;
    data['arrived_at'] = arrivedAt;
    data['succeeded_at'] = succeededAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (merchantData != null) {
      data['merchant_data'] = merchantData!.toJson();
    }
    return data;
  }
}

class MerchantData {
  int? id;
  String? coverImage;
  String? profileImage;
  String? name;
  String? description;
  String? phone;

  MerchantData(
      {this.id,
      this.coverImage,
      this.profileImage,
      this.name,
      this.description,
      this.phone});

  MerchantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coverImage = json['cover_image'];
    profileImage = json['profile_image'];
    name = json['name'];
    description = json['description'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['cover_image'] = coverImage;
    data['profile_image'] = profileImage;
    data['name'] = name;
    data['description'] = description;
    data['phone'] = phone;
    return data;
  }
}

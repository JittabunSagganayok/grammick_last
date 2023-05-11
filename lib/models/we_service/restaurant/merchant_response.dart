class MerchantResponse {
  String? status;
  String? message;
  List<MerchantRestaurantData>? data;

  MerchantResponse({this.status, this.message, this.data});

  MerchantResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MerchantRestaurantData>[];
      json['data'].forEach((v) {
        data!.add(MerchantRestaurantData.fromJson(v));
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

class MerchantIdResponse {
  String? status;
  String? message;
  MerchantRestaurantData? data;

  MerchantIdResponse({this.status, this.message, this.data});

  MerchantIdResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? MerchantRestaurantData.fromJson(json['data'])
        : null;
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

class MerchantRestaurantData {
  int? id;
  String? coverImage;
  String? profileImage;
  String? name;
  String? description;
  String? phone;
  String? serviceDay;
  AddressData? addressData;
  ServiceDayData? serviceDayData;

  MerchantRestaurantData(
      {this.id,
      this.coverImage,
      this.profileImage,
      this.name,
      this.description,
      this.phone,
      this.serviceDay,
      this.addressData,
      this.serviceDayData});

  MerchantRestaurantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coverImage = json['cover_image'];
    profileImage = json['profile_image'];
    name = json['name'];
    description = json['description'];
    phone = json['phone'];
    serviceDay = json['service_day'];
    addressData = json['address_data'] != null
        ? AddressData.fromJson(json['address_data'])
        : null;
    serviceDayData = json['service_day_data'] != null
        ? ServiceDayData.fromJson(json['service_day_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['cover_image'] = coverImage;
    data['profile_image'] = profileImage;
    data['name'] = name;
    data['description'] = description;
    data['phone'] = phone;
    data['service_day'] = serviceDay;
    if (addressData != null) {
      data['address_data'] = addressData!.toJson();
    }
    if (serviceDayData != null) {
      data['service_day_data'] = serviceDayData!.toJson();
    }
    return data;
  }
}

class AddressData {
  int? id;
  int? merchantId;
  String? location;
  String? address;
  String? description;
  String? latitude;
  String? longitude;

  AddressData(
      {this.id,
      this.merchantId,
      this.location,
      this.address,
      this.description,
      this.latitude,
      this.longitude});

  AddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    location = json['location'];
    address = json['address'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_id'] = merchantId;
    data['location'] = location;
    data['address'] = address;
    data['description'] = description;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class ServiceDayData {
  int? id;
  int? merchantId;
  String? sunday;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;

  ServiceDayData(
      {this.id,
      this.merchantId,
      this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday});

  ServiceDayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    sunday = json['sunday'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_id'] = merchantId;
    data['sunday'] = sunday;
    data['monday'] = monday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['saturday'] = saturday;
    return data;
  }
}

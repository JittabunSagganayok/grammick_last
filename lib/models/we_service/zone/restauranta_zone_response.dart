import 'dart:convert';
RestaurantaZoneResponse restaurantaZoneResponseFromJson(String str) => RestaurantaZoneResponse.fromJson(json.decode(str));
String restaurantaZoneResponseToJson(RestaurantaZoneResponse data) => json.encode(data.toJson());
class RestaurantaZoneResponse {
  RestaurantaZoneResponse({
      this.status, 
      this.message, 
      this.zoneList,});

  RestaurantaZoneResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      zoneList = [];
      json['data'].forEach((v) {
        zoneList?.add(Zone.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<Zone>? zoneList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (zoneList != null) {
      map['data'] = zoneList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Zone dataFromJson(String str) => Zone.fromJson(json.decode(str));
String dataToJson(Zone data) => json.encode(data.toJson());
class Zone {
  Zone({
      this.id, 
      this.merchantId, 
      this.image, 
      this.title, 
      this.name, 
      this.tableData,});

  Zone.fromJson(dynamic json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    image = json['image'];
    title = json['title'];
    name = json['name'];
    if (json['table_data'] != null) {
      tableData = [];
      json['table_data'].forEach((v) {
        tableData?.add(TableData.fromJson(v));
      });
    }
  }
  num? id;
  num? merchantId;
  String? image;
  String? title;
  String? name;
  List<TableData>? tableData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['merchant_id'] = merchantId;
    map['image'] = image;
    map['title'] = title;
    map['name'] = name;
    if (tableData != null) {
      map['table_data'] = tableData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

TableData tableDataFromJson(String str) => TableData.fromJson(json.decode(str));
String tableDataToJson(TableData data) => json.encode(data.toJson());
class TableData {
  TableData({
      this.id, 
      this.title, 
      this.people, 
      this.isActive,});

  TableData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    people = json['people'];
    isActive = json['is_active'];
  }
  num? id;
  String? title;
  num? people;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['people'] = people;
    map['is_active'] = isActive;
    return map;
  }

}
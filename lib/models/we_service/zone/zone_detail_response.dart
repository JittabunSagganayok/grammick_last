import 'dart:convert';
ZoneDetailResponse zoneDetailResponseFromJson(String str) => ZoneDetailResponse.fromJson(json.decode(str));
String zoneDetailResponseToJson(ZoneDetailResponse data) => json.encode(data.toJson());
class ZoneDetailResponse {
  ZoneDetailResponse({
      this.status, 
      this.message, 
      this.data,});

  ZoneDetailResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ZoneDetail.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  ZoneDetail? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

ZoneDetail dataFromJson(String str) => ZoneDetail.fromJson(json.decode(str));
String dataToJson(ZoneDetail data) => json.encode(data.toJson());
class ZoneDetail {
  ZoneDetail({
      this.id, 
      this.merchantId, 
      this.image, 
      this.title, 
      this.name, 
      this.tableData,});

  ZoneDetail.fromJson(dynamic json) {
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
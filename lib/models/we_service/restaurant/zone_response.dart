class ZoneResponse {
  String? status;
  String? message;
  List<Data>? data;

  ZoneResponse({this.status, this.message, this.data});

  ZoneResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class ZoneIdResponse {
  String? status;
  String? message;
  Data? data;

  ZoneIdResponse({this.status, this.message, this.data});

  ZoneIdResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  int? merchantId;
  String? image;
  String? title;
  String? name;
  List<TableData>? tableData;

  Data(
      {this.id,
      this.merchantId,
      this.image,
      this.title,
      this.name,
      this.tableData});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    image = json['image'];
    title = json['title'];
    name = json['name'];
    if (json['table_data'] != null) {
      tableData = <TableData>[];
      json['table_data'].forEach((v) {
        tableData!.add(TableData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_id'] = merchantId;
    data['image'] = image;
    data['title'] = title;
    data['name'] = name;
    if (tableData != null) {
      data['table_data'] = tableData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TableData {
  int? id;
  String? title;
  int? people;
  bool? isActive;

  TableData({this.id, this.title, this.people, this.isActive});

  TableData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    people = json['people'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['people'] = people;
    data['is_active'] = isActive;
    return data;
  }
}

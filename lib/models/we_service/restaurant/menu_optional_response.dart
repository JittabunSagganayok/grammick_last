class MenuOptionalResponse {
  String? status;
  String? message;
  Data? data;

  MenuOptionalResponse({this.status, this.message, this.data});

  MenuOptionalResponse.fromJson(Map<String, dynamic> json) {
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
  String? name;
  bool? isNecessary;
  bool? isMultiple;
  List<Optional>? optional;

  Data(
      {this.id,
      this.merchantId,
      this.name,
      this.isNecessary,
      this.isMultiple,
      this.optional});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    name = json['name'];
    isNecessary = json['is_necessary'];
    isMultiple = json['is_multiple'];
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
    data['merchant_id'] = merchantId;
    data['name'] = name;
    data['is_necessary'] = isNecessary;
    data['is_multiple'] = isMultiple;
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
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

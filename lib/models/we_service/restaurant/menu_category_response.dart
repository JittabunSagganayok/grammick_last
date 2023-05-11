class MenuCategoryResponse {
  String? status;
  String? message;
  List<MenuCategoryDetailData>? data;

  MenuCategoryResponse({this.status, this.message, this.data});

  MenuCategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MenuCategoryDetailData>[];
      json['data'].forEach((v) {
        data!.add(MenuCategoryDetailData.fromJson(v));
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

class MenuCategoryIdResponse {
  String? status;
  String? message;
  MenuCategoryDetailData? data;

  MenuCategoryIdResponse({this.status, this.message, this.data});

  MenuCategoryIdResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? MenuCategoryDetailData.fromJson(json['data'])
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

class MenuCategoryDetailData {
  int? id;
  num? merchantId;
  String? name;
  List<MenuData>? menuData;

  MenuCategoryDetailData({
    this.id,
    this.merchantId,
    this.name,
    this.menuData,
  });

  MenuCategoryDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    name = json['name'];
    if (json['menu_data'] != null) {
      menuData = <MenuData>[];
      json['menu_data'].forEach((v) {
        menuData!.add(MenuData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_id'] = merchantId;
    data['name'] = name;
    if (menuData != null) {
      data['menu_data'] = menuData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuData {
  int? id;
  String? image;
  String? name;
  String? description;
  String? price;
  bool? isActive;
  bool added = false;

  MenuData({
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
    this.isActive,
    this.added = false,
  });

  MenuData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['is_active'] = isActive;
    return data;
  }
}

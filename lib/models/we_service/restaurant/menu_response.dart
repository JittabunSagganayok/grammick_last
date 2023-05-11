class MenuResponse {
  String? status;
  String? message;
  List<MenuDetailData>? data;

  MenuResponse({this.status, this.message, this.data});

  MenuResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MenuDetailData>[];
      json['data'].forEach((v) {
        data!.add(MenuDetailData.fromJson(v));
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

class MenuIdResponse {
  String? status;
  String? message;
  MenuDetailData? data;

  MenuIdResponse({this.status, this.message, this.data});

  MenuIdResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MenuDetailData.fromJson(json['data']) : null;
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

class MenuDetailData {
  int? id;
  int? merchantId;
  String? image;
  String? name;
  String? description;
  String? price;
  bool? isActive;
  MenuCategoryData? menuCategoryData;
  List<MenuOptionalData>? menuOptionalData;

  MenuDetailData({
    this.id,
    this.merchantId,
    this.image,
    this.name,
    this.description,
    this.price,
    this.isActive,
    this.menuCategoryData,
    this.menuOptionalData,
  });

  MenuDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchant_id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    isActive = json['is_active'];
    menuCategoryData = json['menu_category_data'] != null
        ? MenuCategoryData.fromJson(json['menu_category_data'])
        : null;
    if (json['menu_optional_data'] != null) {
      menuOptionalData = <MenuOptionalData>[];
      json['menu_optional_data'].forEach((v) {
        menuOptionalData!.add(MenuOptionalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['merchant_id'] = merchantId;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    if (menuCategoryData != null) {
      data['menu_category_data'] = menuCategoryData!.toJson();
    }
    if (menuOptionalData != null) {
      data['menu_optional_data'] =
          menuOptionalData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuCategoryData {
  int? id;
  String? name;

  MenuCategoryData({this.id, this.name});

  MenuCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class MenuOptionalData {
  int? id;
  String? name;
  bool? isNecessary;
  bool? isMultiple;
  List<Optional>? optional;

  MenuOptionalData({
    this.id,
    this.name,
    this.isNecessary,
    this.isMultiple,
    this.optional,
  });

  MenuOptionalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
  bool selected = false; // ถ้าเป็น multiple choice

  Optional({
    this.id,
    this.name,
    this.price,
    this.selected = false,
  });

  Optional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

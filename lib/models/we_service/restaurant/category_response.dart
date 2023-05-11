class CategoryRestaurantResponse {
  String? status;
  String? message;
  List<CategoryRestaurantData>? data;

  CategoryRestaurantResponse({this.status, this.message, this.data});

  CategoryRestaurantResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryRestaurantData>[];
      json['data'].forEach((v) {
        data!.add(CategoryRestaurantData.fromJson(v));
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

class CategoryIdRestaurantResponse {
  String? status;
  String? message;
  CategoryRestaurantData? data;

  CategoryIdRestaurantResponse({this.status, this.message, this.data});

  CategoryIdRestaurantResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? CategoryRestaurantData.fromJson(json['data'])
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

class CategoryRestaurantData {
  int? id;
  String? title;

  CategoryRestaurantData({this.id, this.title});

  CategoryRestaurantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

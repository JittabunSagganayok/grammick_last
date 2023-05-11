/// message : "success"
/// count : 2
/// result : [{"id":1,"name":"ช่างไม้"},{"id":2,"name":"ช่างไฟฟ้า"}]

class ServiceCategoryResponse {
  ServiceCategoryResponse({
    this.message,
    this.count,
    this.result,
  });

  ServiceCategoryResponse.fromJson(dynamic json) {
    message = json['message'];
    count = json['count'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(ServiceCategory.fromJson(v));
      });
    }
  }

  String? message;
  num? count;
  List<ServiceCategory>? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['count'] = count;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "ช่างไม้"

class ServiceCategory {
  ServiceCategory({
    this.id,
    this.name,
  });

  ServiceCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    selected = false;
  }

  num? id;
  String? name;
  bool selected = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

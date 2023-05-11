/// ServiceCategory : {"id":1,"name":"ช่างไม้"}

class AssistantServiceCategoryResponse {
  AssistantServiceCategoryResponse({
      this.serviceCategory,});

  AssistantServiceCategoryResponse.fromJson(dynamic json) {
    serviceCategory = json['ServiceCategory'] != null ? ServiceCategory.fromJson(json['ServiceCategory']) : null;
  }
  ServiceCategory? serviceCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (serviceCategory != null) {
      map['ServiceCategory'] = serviceCategory?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "ช่างไม้"

class ServiceCategory {
  ServiceCategory({
      this.id, 
      this.name,});

  ServiceCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}
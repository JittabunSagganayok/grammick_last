class SaveLocationRequest {
  SaveLocationRequest({
      this.keyword, 
      this.results,});

  SaveLocationRequest.fromJson(dynamic json) {
    keyword = json['keyword'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  String? keyword;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['keyword'] = keyword;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Results {
  Results({
      this.lat, 
      this.lng, 
      this.name, 
      this.address,});

  Results.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    address = json['address'];
  }
  num? lat;
  num? lng;
  String? name;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['address'] = address;
    return map;
  }

}
import 'dart:convert';

/// lat : 0
/// lng : 0

UpdateDriverLocationResponse updateDriverLocationRequestFromJson(String str) =>
    UpdateDriverLocationResponse.fromJson(json.decode(str));

String updateDriverLocationRequestToJson(UpdateDriverLocationResponse data) =>
    json.encode(data.toJson());

class UpdateDriverLocationResponse {
  UpdateDriverLocationResponse({
    this.lat,
    this.lng,
  });

  UpdateDriverLocationResponse.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  num? lat;
  num? lng;

  UpdateDriverLocationResponse copyWith({
    num? lat,
    num? lng,
  }) =>
      UpdateDriverLocationResponse(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}

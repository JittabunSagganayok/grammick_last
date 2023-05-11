import 'dart:convert';

/// favorite : true

SaveFavouriteAddressRequest saveFavouriteAddressRequestFromJson(String str) =>
    SaveFavouriteAddressRequest.fromJson(json.decode(str));

String saveFavouriteAddressRequestToJson(SaveFavouriteAddressRequest data) =>
    json.encode(data.toJson());

class SaveFavouriteAddressRequest {
  SaveFavouriteAddressRequest({
    this.favorite,
    this.addressId,
  });

  SaveFavouriteAddressRequest.fromJson(dynamic json) {
    favorite = json['favorite'];
  }

  num? addressId;
  bool? favorite;

  SaveFavouriteAddressRequest copyWith({
    bool? favorite,
  }) =>
      SaveFavouriteAddressRequest(
        favorite: favorite ?? this.favorite,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['favorite'] = favorite;
    return map;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/models/address/save_location_request.dart';
import 'package:we_link/models/place/place_api_response.dart';

class SearchPlaceRepository {
  Dio dio;

  SearchPlaceRepository(this.dio);

  Future<List<AddressResponse>> searchByPlace(
    String place,
    LatLng latLng,
  ) async {
    // var response = await dio.get('activities/places', data: {'search': place});
    //
    // var myAddressResponse = MyAddressResponse.fromJson(response.data);
    //
    // if (myAddressResponse.result?.isNotEmpty == true) {
    //   return myAddressResponse.result ?? [];
    // }

    var placeResponse = await dio.get(
      'https://maps.googleapis.com/maps/api/place/textsearch/json',
      queryParameters: {
        'query': place,
        'location': '${latLng.latitude},${latLng.longitude}',
        'radius': 50000,
        'key': dotenv.env['placeApiKey'].toString(),
        'language': 'th_TH',
      },
    );

    var placeData = PlaceApiResponse.fromJson(placeResponse.data);

    if (placeData.placeList?.isEmpty == true) {
      return [];
    }

    List<AddressResponse> addressList = [];
    SaveLocationRequest? saveLocation = SaveLocationRequest();
    for (PlaceDetail element in placeData.placeList ?? []) {
      addressList.add(AddressResponse(
        name: element.name,
        address: element.formattedAddress ?? "",
        detail: element.formattedAddress,
        lat: element.geometry?.location?.lat?.toDouble() ?? -1,
        lng: element.geometry?.location?.lng?.toDouble() ?? -1,
        id: -1,
        current: false,
        favorite: false,
      ));

      saveLocation.results?.add(Results(
        name: element.name,
        lat: element.geometry?.location?.lat?.toDouble() ?? -1,
        lng: element.geometry?.location?.lng?.toDouble() ?? -1,
        address: element.formattedAddress ?? "",
      ));
    }

    if (saveLocation.results?.isNotEmpty == true) {
      try {
        await dio.post('activities/places', data: saveLocation?.toJson());
      } on DioError catch (e) {}
    }

    return addressList;
  }

  Future<List<AddressResponse>> searchByLatLng(
    num latitude,
    num longitude,
  ) async {
    var placeResponse = await dio.get(
      'https://maps.googleapis.com/maps/api/place/textsearch/json',
      queryParameters: {
        'query': '$latitude,$longitude',
        'radius': 50000,
        'key': dotenv.env['placeApiKey'].toString(),
        'language': 'th_TH',
      },
    );

    var placeData = PlaceApiResponse.fromJson(placeResponse.data);

    if (placeData.placeList?.isEmpty == true) {
      return [];
    }

    List<AddressResponse> addressList = [];
    for (PlaceDetail element in placeData.placeList ?? []) {
      addressList.add(AddressResponse(
        name: element.name,
        address: element.formattedAddress ?? "",
        detail: element.formattedAddress,
        lat: element.geometry?.location?.lat?.toDouble() ?? -1,
        lng: element.geometry?.location?.lng?.toDouble() ?? -1,
        id: -1,
        current: false,
        favorite: false,
      ));
    }

    return addressList;
  }

// Future<List<AddressResponse>> searchByLatLng(
//   num latitude,
//   num longitude,
// ) async {
//   List<AddressResponse> addressList = [];
//
//   var data = await placemarkFromCoordinates(latitude.toDouble(), longitude.toDouble(), localeIdentifier: "th_TH");
//   for (var element in data) {
//     addressList.add(AddressResponse(
//       name: element.name,
//       address: '${element.street} ${element.subLocality} ${element.locality} ${element.administrativeArea} ${element.postalCode}  ${element.country}',
//       detail: '${element.street} ${element.subLocality} ${element.locality} ${element.administrativeArea} ${element.postalCode}  ${element.country}',
//       lat: latitude.toDouble(),
//       lng: longitude.toDouble(),
//       id: -1,
//       current: false,
//       favorite: false,
//     ));
//   }
//
//   return addressList;
//
//   var response = await dio.post('activities/query/address', data: {
//     'lat': latitude,
//     'lng': longitude,
//   });
//   return MyAddressResponse.fromJson(response.data).result ?? [];
// }
}

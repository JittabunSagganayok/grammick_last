import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart';
import 'package:we_link/core/data/search_place_repository.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/models/address/my_address_response.dart';

Future<LatLng> getMyLocation() async {
  var geoLocation = const LatLng(13.942480, 100.529152);
  var result = await Permission.location.request();
  var request = location.Location();
  var serviceEnabled = await request.serviceEnabled();

  if (!result.isGranted) {
    return geoLocation;
  }

  if (!serviceEnabled) {
    return geoLocation;
  }

  try {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    geoLocation = LatLng(position.latitude, position.longitude);
    return geoLocation;
  } catch (e) {
    return geoLocation;
  }
}

Future<AddressResponse> getCurrentLocation() async {
  SearchPlaceRepository searchPlaceRepository = appModule.get();
  var geoLocation = const LatLng(13.942480, 100.529152);
  var result = await Permission.location.request();
  var request = location.Location();
  var serviceEnabled = await request.serviceEnabled();

  if (!result.isGranted) {
    List<AddressResponse> address = await searchPlaceRepository.searchByLatLng(
        geoLocation.latitude, geoLocation.longitude,);
    return address.first;
  }

  if (!serviceEnabled) {
    List<AddressResponse> address = await searchPlaceRepository.searchByLatLng(
        geoLocation.latitude, geoLocation.longitude,);
    return address.first;
  }

  try {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    if (kDebugMode) {
      geoLocation = const LatLng(13.942480, 100.529152);
    }  else{
      geoLocation = LatLng(position.latitude, position.longitude);
    }
  } catch (e) {
    List<AddressResponse> address = await searchPlaceRepository.searchByLatLng(
        geoLocation.latitude, geoLocation.longitude,);
    return address.first;
  }

  List<AddressResponse> address = await searchPlaceRepository.searchByLatLng(
      geoLocation.latitude, geoLocation.longitude,);
  return address.first;
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/feature/assistant/data/assistant_request.dart';
import 'package:we_link/models/activity/assistant/service_category_response.dart';

import '../../../helper/app_helper.dart';
import '../../../models/address/my_address_response.dart';

class WeAssistantViewModel extends GetxController {
  Dio dio;

  var serviceCategoryList = <ServiceCategory>[].obs;

  WeAssistantViewModel(this.dio);

  var loading = false.obs;

  Map<String, bool> tabList = {
    "Errand": true,
    "Shopping": false,
    "Fix": false,
  }.obs;

  var isSelectedAddress = false.obs;
  var pickupAddress = AddressResponse().obs;
  var destinationAddress = AddressResponse().obs;
  var estimateTimeText = ''.obs;
  var estimateTimeValue = 0.obs;

  var serviceCategory = 'Service Category'.obs;
  var serviceCategoryId = 0.obs;
  var moreDetail = ''.obs;
  var offerPrice = ''.obs;
  var weFixImage = <String>[].obs;

  var isWeFixSelected = false.obs;

  var currentLocation = LatLng(0, 0);
  Set<Marker> currentMarker = Set();

  Future initLocation() async {
    loading.value = true;
    var address = await getCurrentLocation();

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo2.png",
    );

    currentLocation = LatLng(address?.lat ?? 0, address?.lng ?? 0);

    currentMarker.add(Marker(
      markerId: MarkerId(currentLocation.toString()),
      position: currentLocation,
      icon: markerbitmap,
    ));

    await getServiceCategory();

    loading.value = false;
  }

  AssistantRequest createRequest() {

    var assistantType = '';

    for (var element in tabList.entries) {
      if (element.value == true) {
        assistantType = element.key.toUpperCase();
      }
    }

    if (isWeFixSelected.isTrue) {
      return AssistantRequest.wefix(
        assistantType: assistantType,
        pickupAddress: pickupAddress.value,
        moreDetail: moreDetail.value,
        offerPrice: offerPrice.value,
        serviceCategory: serviceCategoryList.firstWhere((element) => element.selected == true),
        weFixImage: weFixImage.value,
      );
    }

    return AssistantRequest(
      assistantType: assistantType,
      pickupAddress: pickupAddress.value,
      destinationAddress: destinationAddress.value,
      estimateTime: estimateTimeValue.value,
    );
  }

  void setTabSelected(MapEntry<String, bool> element) {
    pickupAddress.value = AddressResponse();
    destinationAddress.value = AddressResponse();

    estimateTimeText.value = '';
    estimateTimeValue.value = 0;

    serviceCategory.value = 'Service Category';
    serviceCategoryId.value = 0;
    moreDetail.value = '';
    offerPrice.value = '';
    weFixImage.clear();

    tabList.forEach((key, value) {
      tabList[key] = false;
    });

    tabList[element.key] = true;

    isWeFixSelected.value = element.key == 'Fix';
  }

  Future getServiceCategory() async {
    var response = await dio.get('admin/categories');
    var data = ServiceCategoryResponse.fromJson(response.data);
    serviceCategoryList.value = data.result ?? [];
  }

  void checkSelectedServiceCategory() {

    for (var e in serviceCategoryList) {
      if (e.selected == true) {
        serviceCategory.value = e.name ?? '';
        serviceCategoryId.value = e.id?.toInt() ?? 0;
      }
    }
  }

  LatLng getPickUpLatLng() => LatLng(pickupAddress.value.lat ?? 0,pickupAddress.value.lng ?? 0);
}

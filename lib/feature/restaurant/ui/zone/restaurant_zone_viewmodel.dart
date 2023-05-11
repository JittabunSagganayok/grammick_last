import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/we_service/zone/restauranta_zone_response.dart';
import 'restaurant_zone_screen.dart';

class RestaurantZoneViewModel extends GetxController {
  Dio dio;

  var zoneList = <Zone>[].obs;
  var loading = false.obs;

  RestaurantZoneViewModel(this.dio);

  Future getZoneList({
    required RestaurantZoneArgument arguments,
  }) async {
    loading.value = true;
    var response = await dio.get('restaurant/zone?merchant_id=${arguments.restaurantId}');
    var data = RestaurantaZoneResponse.fromJson(response.data);
    zoneList.value = data.zoneList ?? [];
    loading.value = false;
  }
}

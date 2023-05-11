import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../models/we_service/zone/restauranta_zone_response.dart';
import '../../../../models/we_service/zone/zone_detail_response.dart';
import 'restaurant_zone_detail_screen.dart';

class RestaurantZoneDetailViewModel extends GetxController {
  Dio dio;

  var zoneDetail = ZoneDetail().obs;
  var loading = false.obs;
  late RestaurantZoneDetailArgument argument;

  RestaurantZoneDetailViewModel(this.dio);

  void setArguments(RestaurantZoneDetailArgument arguments) {
    argument = arguments;
  }

  Future getZoneDetail({
    required RestaurantZoneDetailArgument arguments,
  }) async {
    loading.value = true;
    var response = await dio.get('restaurant/zone/${arguments.zoneId}');
    var data = ZoneDetailResponse.fromJson(response.data);
    zoneDetail.value = data.data!;
    loading.value = false;
  }
}

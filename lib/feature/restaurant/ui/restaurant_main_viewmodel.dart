import 'package:get/state_manager.dart';

import '../../../di/app_module.dart';
import '../../../models/error/error_response.dart';
import '../../../models/we_service/booking/booking_response.dart';
import '../../../models/we_service/restaurant/merchant_response.dart';
import '../../../shared/tag/app_tag_widget.dart';
import '../../booking/domain/usecase/booking_usecase.dart';
import '../domain/usecase/restarant_usecase.dart';

class RestaurantMainViewModel extends GetxController {
  RestaurantMainViewModel(
    this._restaurantUseCase,
    this._bookingUseCase,
  );

  RestaurantUseCase _restaurantUseCase;
  BookingUseCase _bookingUseCase;

  var tags = <AppTagItem>[].obs;
  var merchants = <MerchantRestaurantData>[].obs;
  int indexTag = 0;

  var bookingList = <BookingData>[].obs;

  Future<void> init() async {
    await getCategoryRestaurant();
    await getMerchantRestaurant();
    await getBooking();
  }

  Future<void> getCategoryRestaurant() async {
    try {
      var response = await _restaurantUseCase.getCategoryRestaurant();

      var count = 0;
      for (var element in response) {
        tags.add(
          AppTagItem(
            element.title!,
            count == 0 ? true : false,
            element.id!,
          ),
        );
        count++;
      }

      update();
    } on ErrorResponse catch (e) {
      tags.value = [];
    }
  }

  void setTagsSelected(AppTagItem item) {
    for (var element in tags) {
      element.checked = false;
    }
    item.checked = true;
    indexTag = tags.indexWhere((element) => element.id == item.id);

    update();
  }

  Future<void> getMerchantRestaurant() async {
    try {
      var item = tags[indexTag];

      var response =
          await _restaurantUseCase.getMerchantRestaurant(categoryId: item.id);
      merchants.value = [];
      merchants.value = response;
      update();
    } on ErrorResponse catch (e) {
      merchants.value = [];
    }
  }

  Future<void> getBooking() async {
    try {
      // loading.value = true;
      var response = await _bookingUseCase.getBooking(
        userId: userProfileTemp!.id!,
        merchantType: 'RESTAURANT', // RESTAURANT, SERVICE
      );
      bookingList.value = response ?? [];

      // loading.value = false;

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }
}

class RestaurantArguments {
  MerchantRestaurantData? merchantRestaurantData;
  num? merchantId;

  RestaurantArguments({
    this.merchantRestaurantData,
    this.merchantId,
  });
}

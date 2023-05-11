import 'package:get/state_manager.dart';

import '../../../di/app_module.dart';
import '../../../models/error/error_response.dart';
import '../../../models/we_service/booking/item_in_cart_response.dart';
import '../../../models/we_service/restaurant/menu_category_response.dart';
import '../../../models/we_service/restaurant/merchant_response.dart';
import '../../booking/domain/usecase/booking_usecase.dart';
import '../domain/usecase/restarant_usecase.dart';
import 'restaurant_main_viewmodel.dart';

class RestaurantDetailViewModel extends GetxController {
  RestaurantDetailViewModel(
    this.restaurantUseCase,
    this.bookingUseCase,
  );
  RestaurantUseCase restaurantUseCase;
  BookingUseCase bookingUseCase;

  late MerchantRestaurantData merchantData;
  late num? merchantId;
  var menuCate = <MenuCategoryDetailData>[].obs;
  ItemInCartData? itemInCartData;

  void setArguments(RestaurantArguments arguments) {
    merchantData = arguments.merchantRestaurantData!;
    merchantId = arguments.merchantId!;
  }

  Future<void> init() async {
    await getMenuCategoryRestaurant();
    await getItemInCartBooking();
    await checkItemInCartAdded();
  }

  Future<void> getMenuCategoryRestaurant() async {
    try {
      var response = await restaurantUseCase.getMenuCategoryRestaurant(
        merchantId: merchantId!,
      );
      menuCate.value = response;
      update();
    } on ErrorResponse catch (e) {
      menuCate.value = [];
    }
  }

  Future<void> getItemInCartBooking() async {
    try {
      var response = await bookingUseCase.getItemInCartBooking(
        userId: userProfileTemp!.id!,
        merchantId: merchantId!,
      );
      itemInCartData = response;
      print('itemInCart: ${itemInCartData?.itemData?.length}');

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }

  Future<void> checkItemInCartAdded() async {
    if (itemInCartData?.itemData != null) {
      for (var item in menuCate) {
        /// วนลูป menu category
        if (item.menuData != null) {
          for (var itemMenu in item.menuData!) {
            /// วนลูป ของใน ตะกร้าว่ามีค่า item_id ตรงกันหรือไม่
            itemInCartData?.itemData?.forEach((element) {
              if (itemMenu.id == element.itemId) {
                itemMenu.added = true;
              }
            });
          }
        }
      }
    }

    update();
  }
}

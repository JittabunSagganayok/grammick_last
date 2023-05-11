import 'package:get/get.dart';

import '../../../di/app_module.dart';
import '../../../models/error/error_response.dart';
import '../../../models/we_service/booking/item_in_cart_response.dart';
import '../../booking/domain/usecase/booking_usecase.dart';
import 'choose_your_order_screen.dart';

class ChooseYourOrderViewModel extends GetxController {
  BookingUseCase bookingUseCase;

  ChooseYourOrderViewModel(this.bookingUseCase);

  var loading = true.obs;
  ItemInCartData? itemInCartData;
  var itemInCart = <ItemData>[].obs;

  var price = 0;
  var quantity = 1;

  num? merchantId;

  bool fromBookingPage = false;

  void setArguments(ChooseYourOrderArguments arguments) {
    merchantId = arguments.merchantId;
    fromBookingPage = arguments.fromBookingPage;
  }

  Future<void> init() async {
    loading.value = true;
    await getItemInCartBooking();
    loading.value = false;
  }

  Future<void> getItemInCartBooking() async {
    try {
      var response = await bookingUseCase.getItemInCartBooking(
        userId: userProfileTemp!.id!,
        merchantId: merchantId!,
      );
      itemInCartData = response;
      itemInCart.value = itemInCartData?.itemData ?? [];
      print('itemInCart: ${itemInCartData?.itemData?.length}');

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }

  String getSumPriceText() {
    if (itemInCart.isNotEmpty) {
      for (var element in itemInCart) {
        price += int.parse(element.total.toString());
      }
    }

    return 'Booking $price ฿';
  }

  void addQuantity() {
    if (quantity < 10) {
      quantity++;
    }

    update();
  }

  void removeQuantity() {
    if (quantity > 0) {
      quantity--;
    }

    update();
  }
}

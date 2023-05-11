import 'package:get/state_manager.dart';

import '../../../../di/app_module.dart';
import '../../../../models/error/error_response.dart';
import '../../../../models/we_service/booking/booking_update_request.dart';
import '../../../../models/we_service/booking/item_in_cart_response.dart';
import '../../domain/usecase/booking_usecase.dart';
import 'booking_table_screen.dart';

class BookingTableViewModel extends GetxController {
  BookingTableViewModel(this.bookingUseCase);
  BookingUseCase bookingUseCase;

  var loading = true.obs;

  // CartData? cartData;
  ItemInCartData? itemInCartData;

  late BookingTableArgument argument;
  void setArguments(BookingTableArgument arguments) {
    argument = arguments;

    print('[BookingTable] argument: table: ${argument.tableId}');
    print('[BookingTable] argument: zoneId: ${argument.zoneId}');
    print('[BookingTable] argument: merchantId: ${argument.merchantId}');
  }

  Future<void> getItemInCartBooking() async {
    try {
      loading.value = true;
      var response = await bookingUseCase.getItemInCartBooking(
        userId: userProfileTemp!.id!,
        merchantId: argument.merchantId,
      );
      itemInCartData = response;
      loading.value = false;

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }

  Future<void> updateBooking() async {
    try {
      var response = await bookingUseCase.updateBooking(
        bookingId: itemInCartData!.cartData!.bookingId!,
        request: BookingUpdateRequest(
          zoneId: argument.zoneId,
          tableId: argument.tableId,
          reservationDate: '2023-05-20 17:42', //! ล็อคไว้ก่อน
          people: 2, //! ล็อคไว้ก่อน
          paymentMethod: 'CASH', //! ล็อคไว้ก่อน
        ),
      );

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }

  Future<void> sendBookingPlace() async {
    try {
      var response = await bookingUseCase.sendBookingPlace(
        id: itemInCartData!.cartData!.bookingId!,
      );

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }

  String getSumPriceText() {
    var price = 0;

    if (itemInCartData!.itemData!.isNotEmpty) {
      for (var element in itemInCartData!.itemData!) {
        price += int.parse(element.total.toString());
      }
    }

    update();

    return 'Reserve $price ฿';
  }
}

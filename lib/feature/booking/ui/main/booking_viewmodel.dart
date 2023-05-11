import 'package:get/state_manager.dart';

import '../../../../di/app_module.dart';
import '../../../../models/error/error_response.dart';
import '../../../../models/we_service/booking/booking_response.dart';
import '../../domain/entity/booking_tab_item.dart';
import '../../domain/usecase/booking_usecase.dart';

class BookingViewModel extends GetxController {
  BookingViewModel(this._bookingUseCase);

  BookingUseCase _bookingUseCase;

  var loading = true.obs;
  var bookingTabs = <BookingTabItem>[].obs;
  var bookingList = <BookingData>[].obs;

  Future<void> init() async {
    await getBooking();
    initBookingItem();
  }

  void initBookingItem() {
    bookingTabs
      ..add(
        BookingTabItem(
          label: 'Reserve',
          badge: bookingList.length,
          selected: true,
        ),
      )
      ..add(
        BookingTabItem(
          label: 'Continue booking',
          badge: 0,
        ),
      );
  }

  void updateTabChanged(int index) {
    bookingTabs
        .where((element) => element.selected == true)
        .map((e) => e.selected = false)
        .toList();
    bookingTabs[index].selected = true;
    bookingTabs.refresh();
  }

  Future<void> getBooking() async {
    try {
      loading.value = true;
      var response = await _bookingUseCase.getBooking(
        userId: userProfileTemp!.id!,
        merchantType: 'RESTAURANT', // RESTAURANT, SERVICE
      );
      bookingList.value = response ?? [];

      loading.value = false;

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }
}

import 'dart:ui';

import 'package:get/get.dart';

import '../../../../extensions/date_extension.dart';
import '../../../../models/error/error_response.dart';
import '../../../../models/we_service/booking/booking_response.dart';
import '../../../../models/we_service/booking/item_booking_response.dart';
import '../../../../shared/timeline_stepper/timeline_stepper_widget.dart';
import '../../domain/entity/contact_information_item.dart';
import '../../domain/usecase/booking_usecase.dart';
import '../components/booking_service_info_section.dart';
import 'booking_summary_screen.dart';

class BookingSummaryViewModel extends GetxController {
  BookingSummaryViewModel(this._bookingUseCase);
  BookingUseCase _bookingUseCase;

  var loading = true.obs;
  var timelineStepperList = <TimelineStepperItem>[].obs;
  var serviceInfoList = <BookingServiceInfoItem>[].obs;
  var contactInfoList = <ContactInformationItem>[].obs;

  var itemBooking = <ItemBookingData>[].obs;
  BookingData? bookingData;
  var total = 0;

  late BookingSummaryArguments arguments;
  void setArguments(BookingSummaryArguments arguments) {
    this.arguments = arguments;
  }

  Future<void> init() async {
    loading.value = true;
    await getBookingByid();
    await getItemBooking();
    await initInfo();
    loading.value = false;
  }

  Future<void> initInfo() async {
    timelineStepperList
      ..add(TimelineStepperItem(
        title: 'Place Order',
        // subtitle: '19 : 09 pm 20/04/22',
        subtitle: bookingData!.placedAt != null
            ? DateTime.parse(bookingData!.placedAt!).formatDateTimeBooking()
            : '',
        active: bookingData!.placedAt != null ? true : false,
      ))
      ..add(TimelineStepperItem(
        title: 'Confirm Order',
        subtitle: bookingData!.confirmedAt != null
            ? DateTime.parse(bookingData!.confirmedAt!).formatDateTimeBooking()
            : '',
        active: bookingData!.confirmedAt != null ? true : false,
      ))
      ..add(TimelineStepperItem(
        title: 'Use Service',
        subtitle: bookingData!.arrivedAt != null
            ? DateTime.parse(bookingData!.arrivedAt!).formatDateTimeBooking()
            : '',
        active: bookingData!.arrivedAt != null ? true : false,
      ));

    serviceInfoList
      ..add(
        BookingServiceInfoItem(
          title: bookingData!.merchantType == 'RESTAURANT'
              ? 'Restaurant\nPolicy'
              : 'Service\nPolicy',
          icon: 'assets/icon_policy.svg',
          iconColor: Color(0xff5CD5F0),
          backgroundColor: Color(0xffDFF9FF),
          type: BookingServiceInfoItemType.POLICY,
        ),
      )
      ..add(
        BookingServiceInfoItem(
          title: 'Terms &\nConditions',
          icon: 'assets/icon_term.svg',
          iconColor: Color(0xff4FDCAB),
          backgroundColor: Color(0xffDFFFF4),
          type: BookingServiceInfoItemType.TERM_AND_COND,
        ),
      )
      ..add(
        BookingServiceInfoItem(
          title: 'Get\nDirections',
          icon: 'assets/icon_direction_circle.svg',
          iconColor: Color(0xff189B58),
          backgroundColor: Color(0xffCEFFCD),
          type: BookingServiceInfoItemType.DIRECTION,
        ),
      );

    contactInfoList
      ..add(ContactInformationItem(
          icon: 'assets/icon_firstname.svg',
          title: 'Name-Lastname',
          data: 'Madison James'))
      ..add(ContactInformationItem(
          icon: 'assets/icon_mail.svg', title: 'Email', data: 'jono@gmail.com'))
      ..add(ContactInformationItem(
          icon: 'assets/icon_phone.svg', title: 'Phone', data: '098-180-9129'))
      ..add(ContactInformationItem(
          icon: 'assets/icon_map.svg', title: 'Country', data: 'Thailand'));
  }

  Future<void> getBookingByid() async {
    try {
      // loading.value = true;
      var response = await _bookingUseCase.getBookingByid(
        id: arguments.bookingId!,
      );
      bookingData = response;

      // loading.value = false;

      update();
    } on ErrorResponse catch (e) {
      // menuCate.value = [];
    }
  }

  Future<void> getItemBooking() async {
    try {
      // loading.value = true;
      var response = await _bookingUseCase.getItemBooking(
        bookingId: arguments.bookingId!,
      );
      itemBooking.value = response;
      getSumPriceText();
      // loading.value = false;

      update();
    } on ErrorResponse catch (e) {
      itemBooking.value = [];
    }
  }

  void getSumPriceText() {
    if (itemBooking.isNotEmpty) {
      for (var element in itemBooking) {
        total += int.parse(element.total.toString());
      }
    }

    update();
  }
}

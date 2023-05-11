import 'package:get/get.dart';
import 'package:we_link/feature/booking/ui/cancel/booking_cancel_order_screen.dart';
import 'package:we_link/feature/booking/ui/confirmation/booking_confirmation_screen.dart';
import 'package:we_link/feature/booking/ui/main/booking_screen.dart';
import 'package:we_link/feature/booking/ui/summary/booking_summary_screen.dart';
import 'package:we_link/feature/booking/ui/table/booking_table_screen.dart';

import '../ui/checkin/booking_checkin_screen.dart';

class BookingRoute {
  static String bookingConfirmationScreen = '/bookingConfirmationScreen';
  static String serviceHotelBookingScreen = '/serviceHotelBookingScreen';
  static String serviceHotelBookingSummaryScreen = '/serviceHotelBookingSummaryScreen';
  static String serviceHotelBookingCheckScreen = '/serviceHotelBookingCheckScreen';
  static String bookingCancelOrderScreen = '/bookingCancelOrderScreen';
  static String bookingTableScreen = '/bookingTableScreen';

  static final screens = [
    GetPage(
      name: serviceHotelBookingScreen,
      page: () => BookingScreen(),
    ),
    GetPage(
      name: serviceHotelBookingSummaryScreen,
      page: () => BookingSummaryScreen(),
    ),
    GetPage(
      name: serviceHotelBookingCheckScreen,
      page: () => BookingCheckInScreen(),
    ),
    GetPage(
      name: bookingConfirmationScreen,
      page: () => BookingConfirmationScreen(),
    ),
    GetPage(
      name: bookingCancelOrderScreen,
      page: () => BookingCancelOrderScreen(),
    ),
    GetPage(
      name: bookingTableScreen,
      page: () => BookingTableScreen(),
    ),
  ];
}

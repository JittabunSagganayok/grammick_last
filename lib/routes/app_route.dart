import 'package:get/get.dart';
import 'package:we_link/feature/advertise/route/advertise_route.dart';
import 'package:we_link/feature/booking/route/booking_route.dart';
import 'package:we_link/feature/hotel/route/hotel_route.dart';
import 'package:we_link/feature/order/route/choose_your_order_route.dart';
import 'package:we_link/feature/payment/route/payment_method_route.dart';
import 'package:we_link/feature/report_order/report_problem_screen.dart';
import 'package:we_link/feature/restaurant/route/restaurant_main_route.dart';
import 'package:we_link/feature/review/route/customer_review_route.dart';
import 'package:we_link/feature/term/route/term_route.dart';
import 'package:we_link/feature/we_service/route/we_service_route.dart';

import '../feature/favorite/route/my_favourite_route.dart';
import '../feature/service_reserve/route/service_reserve_route.dart';

class AppRoute {
  final List<GetPage<dynamic>> _screens = [];

  AppRoute() {
    _screens.addAll(HotelRoute.screens);
    _screens.addAll(WeServiceRoute.screens);
    _screens.addAll(BookingRoute.screens);
    _screens.addAll(AdvertiseRoute.screens);
    _screens.addAll(HotelRoute.screens);
    _screens.addAll(MyFavouriteRoute.screens);
    _screens.addAll(CustomerReviewRoute.screens);
    _screens.addAll(PaymentMethodRoute.screens);
    _screens.addAll(RestaurantMainRoute.screens);
    _screens.addAll(ChooseYourOrderRoute.screens);
    _screens.addAll(TermRoute.screens);
    _screens.addAll(ServiceReserveRoute.screens);

    _screens.add(GetPage(
      name: ReportProblemScreen.screen,
      page: () => ReportProblemScreen(),
    ));

  }

  get screens => _screens;
}

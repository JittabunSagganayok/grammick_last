import 'package:get/get.dart';
import 'package:we_link/feature/search/ui/hotel/search_hotel_screen.dart';
import 'package:we_link/feature/service_reserve/ui/service_reserve_screen.dart';

class ServiceReserveRoute {
  static String serviceReserveScreen = '/serviceReserveScreen';

  static final screens = [
    GetPage(
      name: serviceReserveScreen,
      page: () => ServiceReserveScreen(),
    ),
  ];
}

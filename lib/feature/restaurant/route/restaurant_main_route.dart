import 'package:get/get.dart';
import 'package:we_link/feature/restaurant/ui/menu_info_screen.dart';
import 'package:we_link/feature/restaurant/ui/restaurant_detail_screen.dart';
import 'package:we_link/feature/restaurant/ui/restaurant_information_screen.dart';
import 'package:we_link/feature/restaurant/ui/restaurant_main_screen.dart';

class RestaurantMainRoute {
  static String serviceRestaurantMainScreen = '/serviceRestaurantMainScreen';
  static String serviceRestaurantDetailScreen = '/serviceRestaurantDetailScreen';
  static String restaurantInfoScreen = '/RestaurantInformationScreen';
  static String menuInfoScreen = '/menuInfoScreen';

  static final screens = [
    GetPage(
      name: serviceRestaurantMainScreen,
      page: () => RestaurantMainScreen(),
    ),
    GetPage(
      name: serviceRestaurantDetailScreen,
      page: () => RestaurantDetailScreen(),
    ),
    GetPage(
      name: restaurantInfoScreen,
      page: () => RestaurantInformationScreen(),
    ),
    GetPage(
      name: menuInfoScreen,
      page: () => MenuInfoScreen(),
    ),
  ];
}

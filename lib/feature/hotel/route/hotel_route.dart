import 'package:get/get.dart';
import 'package:we_link/feature/hotel/ui/detail/hotel_detail_screen.dart';
import 'package:we_link/feature/hotel/ui/main/hotel_main_screen.dart';
import 'package:we_link/feature/hotel/ui/room/room_detail_screen.dart';

class HotelRoute {
  static String hotelMainScreen = '/hotelMainScreen';
  static String hotelDetailScreen = '/hotelDetailScreen';
  static String roomDetailScreen = '/roomDetailScreen';

  static final screens = [
    GetPage(
      name: hotelMainScreen,
      page: () => HotelMainScreen(),
    ),
    GetPage(
      name: hotelDetailScreen,
      page: () => HotelDetailScreen(),
    ),
    GetPage(
      name: roomDetailScreen,
      page: () => RoomDetailScreen(),
    ),
  ];
}

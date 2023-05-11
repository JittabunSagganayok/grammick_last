import 'package:get/get.dart';
import 'package:we_link/feature/search/ui/hotel/search_hotel_screen.dart';
import 'package:we_link/feature/search/ui/result/result_search_screen.dart';
import 'package:we_link/feature/term/ui/term_and_cond_screen.dart';


class TermRoute {
  static String termAndCondScreen = '/termAndCondScreen';

  static final screens = [
    GetPage(
      name: termAndCondScreen,
      page: () => TermAndCondScreen(),
    ),
  ];
}

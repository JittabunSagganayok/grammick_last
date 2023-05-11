import 'package:get/get.dart';
import 'package:we_link/feature/search/ui/result/result_search_screen.dart';
import 'package:we_link/feature/search/ui/hotel/search_hotel_screen.dart';

import '../ui/recent/recent_search_screen.dart';

class SearchHotelRoute{
  static String searchHotelScreen = '/searchHotelScreen';
  static String recentSearchScreen = '/recentSearchScreen';
  static String resultSearchScreen = '/resultSearchScreen';

  static final screens = [
    GetPage(
      name: searchHotelScreen,
      page: () => SearchHotelScreen(),
    ),
    GetPage(
      name: recentSearchScreen,
      page: () => RecentSearchScreen(),
    ),
    GetPage(
      name: resultSearchScreen,
      page: () => ResultSearchScreen(),
    ),
  ];
}
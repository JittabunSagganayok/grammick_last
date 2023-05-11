import 'package:get/get.dart';
import 'package:we_link/feature/favorite/ui/my_favourite_screen.dart';

class MyFavouriteRoute {
  static String myFavouriteScreen = '/myFavouriteScreen';

  static final screens = [
    GetPage(
      name: myFavouriteScreen,
      page: () => MyFavouriteScreen(),
    ),
  ];
}

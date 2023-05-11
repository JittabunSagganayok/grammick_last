import 'package:get/get.dart';

import '../ui/advertise_screen.dart';

class AdvertiseRoute {
  static String advertiseScreen = '/advertiseScreen';

  static final screens = [
    GetPage(
      name: advertiseScreen,
      page: () => AdvertiseScreen(),
    ),
  ];
}

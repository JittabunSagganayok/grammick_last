import 'package:get/get.dart';
import 'package:we_link/feature/we_service/ui/we_service_screen.dart';

class WeServiceRoute {
  static String weServiceScreen = '/weServiceScreen';

  static final screens = [
    GetPage(
      name: weServiceScreen,
      page: () => WeServiceScreen(),
    ),
  ];
}

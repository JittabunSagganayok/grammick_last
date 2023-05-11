import 'package:get/get.dart';
import 'package:we_link/feature/order/ui/choose_your_order_screen.dart';

class ChooseYourOrderRoute {
  static String chooseYourOrderScreen = '/chooseYourOrderScreen';

  static final screens = [
    GetPage(
      name: chooseYourOrderScreen,
      page: () => ChooseYourOrderScreen(),
    ),
  ];
}

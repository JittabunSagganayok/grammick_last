import 'package:get/get.dart';
import 'package:we_link/feature/favorite/ui/my_favourite_screen.dart';
import 'package:we_link/feature/payment/ui/payment_method_screen.dart';

class PaymentMethodRoute {
  static String paymentMethodScreen = '/paymentMethodScreen';

  static final screens = [
    GetPage(
      name: paymentMethodScreen,
      page: () => PaymentMethodScreen(),
    ),
  ];
}

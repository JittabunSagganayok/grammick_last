import 'package:get/get.dart';
import 'package:we_link/feature/favorite/ui/my_favourite_screen.dart';
import 'package:we_link/feature/review/ui/customer_review_screen.dart';

class CustomerReviewRoute {
  static String customerReviewScreen = '/customerReviewScreen';

  static final screens = [
    GetPage(
      name: customerReviewScreen,
      page: () => CustomerReviewScreen(),
    ),
  ];
}

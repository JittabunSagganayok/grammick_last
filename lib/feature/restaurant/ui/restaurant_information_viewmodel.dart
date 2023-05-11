import 'package:get/get.dart';

class RestaurantInformationViewModel extends GetxController {
  List<RestaurantInformationItem> infoList = [];

  RestaurantInformationViewModel() {
    infoList
      ..add(
        RestaurantInformationItem(
          'The Mall Bangkapi There are many variations of passages of Lorem Ipsum available, but the ',
          'assets/ic_direction.svg',
          '20km',
        ),
      )
      ..add(
        RestaurantInformationItem(
          'See Branch',
          'assets/ic_see_branch.svg',
          '40 Branch',
          showArrowIcon: true,
        ),
      )
      ..add(
        RestaurantInformationItem(
          'Open Date',
          'assets/ic_open_close_time.svg',
          'Mon - Sat 10.00 - 20.00 pm',
        ),
      )
      ..add(
        RestaurantInformationItem(
          'Phone',
          'assets/ic_phone.svg',
          '02-198-0982',
        ),
      );
  }
}

class RestaurantInformationItem {
  String title;
  String icon;
  String data;
  bool showArrowIcon;

  RestaurantInformationItem(
    this.title,
    this.icon,
    this.data, {
    this.showArrowIcon = false,
  });
}

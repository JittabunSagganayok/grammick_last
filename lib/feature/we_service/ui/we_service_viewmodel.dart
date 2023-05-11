import 'package:get/state_manager.dart';

class WeServiceViewModel extends GetxController {
  var serviceItems = <WeServiceItemModel>[].obs;

  WeServiceViewModel() {
    serviceItems.add(
      WeServiceItemModel(
        title: 'Restaurant',
        image: 'assets/mock/mock_restaurant.png',
        itemType: WeServiceItemType.RESTAURANT,
      ),
    );
    serviceItems.add(
      WeServiceItemModel(
        title: 'Service',
        image: 'assets/mock/mock_restaurant.png',
        itemType: WeServiceItemType.SERVICE,
      ),
    );
    serviceItems.add(
      WeServiceItemModel(
          title: 'Hotel Booking',
          image: 'assets/mock/mock_restaurant.png',
          itemType: WeServiceItemType.HOTEL),
    );
  }
}

class WeServiceItemModel {
  String title;
  String image;
  WeServiceItemType itemType;

  WeServiceItemModel({
    required this.title,
    required this.image,
    required this.itemType,
  });
}

enum WeServiceItemType { RESTAURANT, SERVICE, HOTEL }

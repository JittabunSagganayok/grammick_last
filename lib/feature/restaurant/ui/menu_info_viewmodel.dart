import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../di/app_module.dart';
import '../../../models/error/error_response.dart';
import '../../../models/we_service/booking/add_item_cart_request.dart';
import '../../../models/we_service/restaurant/menu_category_response.dart';
import '../../../models/we_service/restaurant/menu_response.dart';
import '../../booking/domain/usecase/booking_usecase.dart';
import '../domain/usecase/restarant_usecase.dart';
import 'menu_info_screen.dart';
import 'restaurant_detail_viewmodel.dart';

class MenuInfoViewModel extends GetxController {
  MenuInfoViewModel(this.restaurantUseCase, this.bookingUseCase);

  RestaurantUseCase restaurantUseCase;
  BookingUseCase bookingUseCase;
  late MenuData? itemMenu;
  late MenuCategoryDetailData? menuCategory;

  var loading = true.obs;
  MenuDetailData? menuDetail;

  var price = 0;
  var quantity = 1;

  TextEditingController noteController = TextEditingController();

  void setArguments(MenuDetailArguments arguments) {
    itemMenu = arguments.itemMenu;
    menuCategory = arguments.menuCategory;
  }

  Future<void> init() async {
    loading.value = true;
    await getMenuRestaurantByid();
    loading.value = false;
  }

  Future<void> getMenuRestaurantByid() async {
    try {
      var response = await restaurantUseCase.getMenuRestaurantByid(
        id: itemMenu!.id!,
      );

      menuDetail = response;

      update();
    } on ErrorResponse catch (e) {
      // menuDetail = null;
    }
  }

  Future<void> addItemToCartBooking() async {
    try {
      /// ทำ optional อยู่ในรูปการส่ง Request
      var itemOptional = <ItemOptional>[];
      for (var options in menuDetail!.menuOptionalData!) {
        var option = ItemOptional(
          id: options.id,
          optional: [],
        );

        for (var itemOption in options.optional!) {
          if (itemOption.selected) {
            option.optional!.add(itemOption.id!);
          }
        }

        itemOptional.add(option);
      }

      var response = await bookingUseCase.addItemToCartBooking(
        request: AddItemCartRequest(
          userId: userProfileTemp!.id,
          merchantId: menuDetail!.merchantId,
          itemId: menuDetail!.id,
          quantity: quantity,
          note: noteController.text,
          itemOptional: itemOptional,
        ),
      );

      update();
    } on ErrorResponse catch (e) {
      // menuDetail = null;
    }
  }

  void chooseOption({
    required MenuOptionalData menuOptionalData,
    required Optional option,
  }) {
    if (menuOptionalData.isMultiple!) {
      option.selected = !option.selected;
    } else {
      for (var element in menuOptionalData.optional!) {
        element.selected = false;
      }

      option.selected = true;
      // packageDetail = package;
    }

    update();
  }

  String getSumPriceText() {
    if (menuDetail != null) {
      price = int.parse(menuDetail!.price.toString());

      for (var options in menuDetail!.menuOptionalData!) {
        for (var itemOption in options.optional!) {
          if (itemOption.selected) {
            price += int.parse(itemOption.price.toString());
          }
        }
      }
    }

    price *= quantity;

    return 'Add $price ฿';
  }

  void addQuantity() {
    if (quantity < 10) {
      quantity++;
    }

    update();
  }

  void removeQuantity() {
    if (quantity > 0) {
      quantity--;
    }

    update();
  }
}

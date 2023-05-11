import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:we_link/feature/assistant/data/assistant_request.dart';

import '../../../models/address/my_address_response.dart';

class AssistantOrderDetailViewModel extends GetxController {
  Dio dio;

  AssistantOrderDetailViewModel(this.dio);

  AssistantRequest? assistantRequest;

  var pickUpAddress = AddressResponse().obs;
  var assistantItem = <AssistantItem>[].obs;

  void setParams(AssistantRequest request) {
    assistantRequest = request;
    pickUpAddress.value = assistantRequest?.pickupAddress ?? AddressResponse();

    assistantItem.add(AssistantItem(
      product: TextEditingController(),
      amount: TextEditingController(),
      focusNode: FocusNode(),
    ));
  }

  void setupNewAddress(AddressResponse address) {
    assistantRequest?.pickupAddress = address;
    pickUpAddress.value = address;
  }

  void addMoreProduct() {
    assistantItem.add(AssistantItem(
      product: TextEditingController(),
      amount: TextEditingController(),
      focusNode: FocusNode(),
    ));
  }

  AssistantRequest? createRequest(String productPrice) {
    assistantRequest?.items = assistantItem.value;
    assistantRequest?.estimatePrice = productPrice;
    return assistantRequest;
  }
}

class AssistantItem {
  TextEditingController product = TextEditingController();
  TextEditingController amount = TextEditingController();
  FocusNode focusNode = FocusNode();

  AssistantItem({
    required this.product,
    required this.amount,
    required this.focusNode,
  });
}

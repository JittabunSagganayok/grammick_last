import 'package:we_link/models/activity/assistant/service_category_response.dart';
import 'package:we_link/models/address/my_address_response.dart';

import '../ui/assistant_order_detail_viewmodel.dart';

class AssistantRequest {
  String? assistantType;
  AddressResponse? pickupAddress;
  AddressResponse? destinationAddress;
  num? estimateTime;
  String? name;
  String? phone;
  String? moreDetail;
  List<AssistantItem>? items = [];
  String? estimatePrice;

  ServiceCategory? serviceCategory;
  String? offerPrice = '';
  List<String>? weFixImage = [];
  bool isWeFixOrder = false;

  AssistantRequest({
    this.pickupAddress,
    this.destinationAddress,
    this.estimateTime,
    this.name,
    this.phone,
    this.moreDetail,
    this.items,
    this.estimatePrice,
    this.assistantType,
    this.isWeFixOrder = false,
  });

  AssistantRequest.wefix({
    this.assistantType,
    this.pickupAddress,
    this.serviceCategory,
    this.moreDetail,
    this.offerPrice,
    this.weFixImage,
    this.isWeFixOrder = true,
  });
}

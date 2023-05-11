import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../booking/ui/components/booking_service_info_section.dart';
import '../detail/hotel_detail_viewmodel.dart';

class RoomDetailViewModel extends GetxController {
  var roomOption = <FacilitiesItem>[].obs;
  var serviceInfoList = <BookingServiceInfoItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    roomOption.add(FacilitiesItem('assets/ic_bed.svg', '2 Beds'));
    roomOption.add(FacilitiesItem('assets/ic_guest.svg', 'Limited 2 Guest'));
    roomOption.add(FacilitiesItem('assets/ic_room_size.svg', '150m'));
    roomOption.add(FacilitiesItem('assets/ic_sea_sky.svg', 'View : Sea and Sky'));
    roomOption.add(FacilitiesItem('assets/ic_shower_bath.svg', 'Shower Bath'));

    serviceInfoList.add(
      BookingServiceInfoItem(
        title: 'Terms & Conditions',
        icon: 'assets/icon_direction.svg',
        iconColor: Color(0xff4FDCAB),
        backgroundColor: Color(0xffDFFFF4),
        type: BookingServiceInfoItemType.TERM_AND_COND,
      ),
    );
    serviceInfoList.add(
      BookingServiceInfoItem(
        title: 'Service Policy',
        icon: 'assets/icon_direction.svg',
        iconColor: Color(0xff5CD5F0),
        backgroundColor: Color(0xffDFF9FF),
        type: BookingServiceInfoItemType.POLICY,
      ),
    );
  }
}

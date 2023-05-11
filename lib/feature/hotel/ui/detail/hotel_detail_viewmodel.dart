import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelDetailViewModel extends GetxController{

  var facilitiesItem = <FacilitiesItem>[].obs;
  var roomOption = <FacilitiesItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    facilitiesItem.add(FacilitiesItem('assets/ic_wifi_available.svg', 'Wifi'));
    facilitiesItem.add(FacilitiesItem('assets/ic_breakfast.svg', 'Breakfast'));
    facilitiesItem.add(FacilitiesItem('assets/ic_parking.svg', 'Car Park'));
    facilitiesItem.add(FacilitiesItem('assets/ic_fitness.svg', 'Fitness'));
    facilitiesItem.add(FacilitiesItem('assets/ic_swiming_pool.svg', 'Pool'));

    roomOption.add(FacilitiesItem('assets/ic_bed.svg', '2 Beds'));
    roomOption.add(FacilitiesItem('assets/ic_guest.svg', 'Limited 2 Guest'));
    roomOption.add(FacilitiesItem('assets/ic_room_size.svg', '150m'));
    roomOption.add(FacilitiesItem('assets/ic_sea_sky.svg', 'View : Sea and Sky'));
    roomOption.add(FacilitiesItem('assets/ic_shower_bath.svg', 'Shower Bath'));
  }

}

class FacilitiesItem{
  String icon;
  String label;

  FacilitiesItem(this.icon, this.label);
}
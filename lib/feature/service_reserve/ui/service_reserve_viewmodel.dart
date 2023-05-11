import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/feature/service_reserve/domain/model/our_service_item.dart';

class ServiceReserveViewModel extends GetxController{

  var ourServiceList = <OurServiceItem>[].obs;

  ServiceReserveViewModel(){
    ourServiceList.add(OurServiceItem('assets/ic_beauty_service.png', 'Beauty'));
    ourServiceList.add(OurServiceItem('assets/ic_car_wash_service.png', 'Car Wash'));
    ourServiceList.add(OurServiceItem('assets/ic_spa_service.png', 'Spa'));
    ourServiceList.add(OurServiceItem('assets/ic_karaoke_service.png', 'Karaoke'));
    ourServiceList.add(OurServiceItem('assets/ic_rent_car_service.png', 'Rent Car'));
  }
}
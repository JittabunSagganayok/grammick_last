import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/hotel/ui/detail/hotel_detail_viewmodel.dart';
import 'package:we_link/feature/hotel/ui/room/room_detail_viewmodel.dart';

import '../../../di/app_module.dart';
import '../ui/main/hotel_main_viewmodel.dart';

class HotelModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => HotelMainViewModel());
    appModule.registerFactory(() => HotelDetailViewModel());
    appModule.registerFactory(() => RoomDetailViewModel());
  }
}

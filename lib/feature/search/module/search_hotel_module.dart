import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/search/ui/recent/recent_search_viewmodel.dart';
import 'package:we_link/feature/search/ui/result/result_search_viewmodel.dart';
import 'package:we_link/feature/search/ui/hotel/search_hotel_viewmodel.dart';

class SearchHotelModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => SearchHotelViewModel());
    appModule.registerFactory(() => RecentSearchViewModel());
    appModule.registerFactory(() => ResultSearchViewModel());
  }
}

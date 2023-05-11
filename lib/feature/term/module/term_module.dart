import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/search/ui/recent/recent_search_viewmodel.dart';
import 'package:we_link/feature/search/ui/result/result_search_viewmodel.dart';
import 'package:we_link/feature/search/ui/hotel/search_hotel_viewmodel.dart';
import 'package:we_link/feature/term/ui/term_and_cond_viewmodel.dart';

class TermModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => TermAndCondViewModel());
  }
}

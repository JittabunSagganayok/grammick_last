import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';

import '../ui/advertise_viewmodel.dart';

class AdvertiseModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => AdvertiseViewModel());
  }
}

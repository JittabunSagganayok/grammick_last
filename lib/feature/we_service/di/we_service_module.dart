import 'package:we_link/feature/base/base_module.dart';

import '../../../di/app_module.dart';
import '../ui/we_service_viewmodel.dart';

class WeServiceModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => WeServiceViewModel());
  }
}

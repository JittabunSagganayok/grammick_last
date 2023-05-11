import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/service_reserve/ui/service_reserve_viewmodel.dart';

class ServiceReserveModule extends BaseModule{
  @override
  void provideModule() {
    appModule.registerFactory(() => ServiceReserveViewModel());
  }

}
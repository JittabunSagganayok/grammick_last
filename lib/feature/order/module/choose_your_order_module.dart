import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/order/ui/choose_your_order_viewmodel.dart';

class ChooseYourOrderModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => ChooseYourOrderViewModel(appModule.get()));
  }
}

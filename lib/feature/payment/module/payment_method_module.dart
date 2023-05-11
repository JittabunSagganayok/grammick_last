import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/payment/ui/payment_method_viewmodel.dart';

class PaymentMethodModule extends BaseModule{
  @override
  void provideModule() {
    appModule.registerFactory(() => PaymentMethodViewModel());
  }

}
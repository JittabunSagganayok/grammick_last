import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';

import '../ui/customer_review_view_model.dart';

class CustomerReviewModule extends BaseModule{
  @override
  void provideModule() {
    appModule.registerFactory(() => CustomerReviewViewModel());
  }

}
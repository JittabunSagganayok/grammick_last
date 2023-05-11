import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/favorite/ui/my_favourite_viewmodel.dart';

class MyFavouriteModule extends BaseModule{
  @override
  void provideModule() {
    appModule.registerFactory(() => MyFavouriteViewModel());
  }

}
import '../../../di/app_module.dart';
import '../../base/base_module.dart';
import '../domain/repository/restaurant_repository.dart';
import '../domain/usecase/restarant_usecase.dart';
import '../ui/menu_info_viewmodel.dart';
import '../ui/restaurant_detail_viewmodel.dart';
import '../ui/restaurant_information_viewmodel.dart';
import '../ui/restaurant_main_viewmodel.dart';
import '../ui/zone/restaurant_zone_detail_viewmodel.dart';
import '../ui/zone/restaurant_zone_viewmodel.dart';

class RestaurantMainModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(
        () => RestaurantMainViewModel(appModule.get(), appModule.get()));
    appModule.registerFactory(
        () => RestaurantDetailViewModel(appModule.get(), appModule.get()));
    appModule.registerFactory(() => RestaurantInformationViewModel());
    appModule.registerFactory(() => MenuInfoViewModel(
          appModule.get(),
          appModule.get(),
        ));
    appModule.registerFactory(() => RestaurantRepositoryImpl(appModule.get()));
    appModule.registerFactory(() => RestaurantUseCase(appModule.get()));

    appModule.registerFactory(() => RestaurantZoneViewModel(appModule.get()));
    appModule
        .registerFactory(() => RestaurantZoneDetailViewModel(appModule.get()));
  }
}

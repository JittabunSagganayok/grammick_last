import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/address/domain/repository/address_repository.dart';
import 'package:we_link/feature/address/domain/usecase/save_favourite_address_usecase.dart';
import 'package:we_link/feature/base/base_module.dart';

class AddressModule extends BaseModule{
  @override
  void provideModule() {
    appModule.registerFactory(() => AddressRepositoryImpl(appModule.get()));
    appModule.registerFactory(() => SaveFavouriteAddressUseCaseImpl(appModule.get()));
  }

}
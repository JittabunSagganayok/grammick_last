import 'package:we_link/feature/address/data/model/save_favourite_address_request.dart';
import 'package:we_link/feature/address/data/repository/address_repository.dart';
import 'package:we_link/feature/address/domain/repository/address_repository.dart';

abstract class SaveFavouriteAddressUseCase {
  Future<bool> saveFavouriteAddress({
    required SaveFavouriteAddressRequest request,
  });
}

class SaveFavouriteAddressUseCaseImpl extends SaveFavouriteAddressUseCase {
  AddressRepositoryImpl addressRepository;

  SaveFavouriteAddressUseCaseImpl(this.addressRepository);

  @override
  Future<bool> saveFavouriteAddress({
    required SaveFavouriteAddressRequest request,
  }) async {
    request.favorite = request.favorite == true;
    return addressRepository.saveFavouriteAddress(request: request);
  }
}

import 'package:dio/dio.dart';
import 'package:we_link/feature/address/data/model/save_favourite_address_request.dart';
import 'package:we_link/feature/address/data/repository/address_repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  Dio dio;

  AddressRepositoryImpl(this.dio);

  @override
  Future<bool> saveFavouriteAddress({
    required SaveFavouriteAddressRequest request,
  }) async {
    try{
      await dio.patch('address/${request.addressId ?? ""}',data: request.toJson());
      return true;
    }on DioError catch(e){
      return false;
    }
  }
}

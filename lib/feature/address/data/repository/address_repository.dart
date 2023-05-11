import 'package:flutter/widgets.dart';
import 'package:we_link/feature/address/data/model/save_favourite_address_request.dart';

abstract class AddressRepository {
  Future<bool> saveFavouriteAddress({required SaveFavouriteAddressRequest request,});
}
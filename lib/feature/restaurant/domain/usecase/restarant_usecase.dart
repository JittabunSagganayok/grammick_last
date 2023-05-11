import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../models/error/error_response.dart';
import '../../../../models/we_service/restaurant/category_response.dart';
import '../../../../models/we_service/restaurant/menu_category_response.dart';
import '../../../../models/we_service/restaurant/menu_optional_response.dart';
import '../../../../models/we_service/restaurant/menu_response.dart';
import '../../../../models/we_service/restaurant/merchant_response.dart';
import '../../../../models/we_service/restaurant/table_restaurant_response.dart';
import '../../../../models/we_service/restaurant/zone_response.dart';
import '../repository/restaurant_repository.dart';

class RestaurantUseCase {
  final RestaurantRepositoryImpl _repositoryImpl;

  RestaurantUseCase(this._repositoryImpl);

  /// Merchant
  Future<List<MerchantRestaurantData>> getMerchantRestaurant(
      {required int categoryId}) async {
    try {
      final response =
          await _repositoryImpl.getMerchantRestaurant(categoryId: categoryId);
      return response.data ?? [];
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Merchant by ID
  Future<MerchantIdResponse> getMerchantRestaurantByid(
      {required int id}) async {
    try {
      final response = await _repositoryImpl.getMerchantRestaurantByid(id: id);
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Menu
  Future<MenuResponse> getMenuRestaurant({required int merchantId}) async {
    try {
      final response = await _repositoryImpl.getMenuRestaurant(
        merchantId: merchantId,
      );
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Menu by ID
  Future<MenuDetailData?> getMenuRestaurantByid({required int id}) async {
    try {
      final response = await _repositoryImpl.getMenuRestaurantByid(
        id: id,
      );
      return response.data;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Menu Category
  Future<List<MenuCategoryDetailData>> getMenuCategoryRestaurant(
      {required num merchantId}) async {
    try {
      final response = await _repositoryImpl.getMenuCategoryRestaurant(
        merchantId: merchantId,
      );
      return response.data ?? [];
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Menu Category by ID
  Future<MenuCategoryIdResponse> getMenuCategoryRestaurantByid(
      {required int id}) async {
    try {
      final response = await _repositoryImpl.getMenuCategoryRestaurantByid(
        id: id,
      );
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Menu Optional by ID
  Future<MenuOptionalResponse> getMenuOptionalRestaurantByid(
      {required int id}) async {
    try {
      final response = await _repositoryImpl.getMenuOptionalRestaurantByid(
        id: id,
      );
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Zone
  Future<ZoneResponse> getZoneRestaurant({required int merchantId}) async {
    try {
      final response = await _repositoryImpl.getZoneRestaurant(
        merchantId: merchantId,
      );
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Zone by ID
  Future<ZoneIdResponse> getZoneRestaurantByid({required int id}) async {
    try {
      final response = await _repositoryImpl.getZoneRestaurantByid(
        id: id,
      );
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Table
  Future<TableRestaurantResponse> getTableRestaurant(
      {required int zoneId}) async {
    try {
      final response = await _repositoryImpl.getTableRestaurant(
        zoneId: zoneId,
      );
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Table by ID
  Future<TableIdRestaurantResponse> getTableRestaurantByid(
      {required int id}) async {
    try {
      final response = await _repositoryImpl.getTableRestaurantByid(
        id: id,
      );
      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Category
  Future<List<CategoryRestaurantData>> getCategoryRestaurant() async {
    try {
      final response = await _repositoryImpl.getCategoryRestaurant();
      return response.data ?? [];
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Category by ID
  Future<CategoryRestaurantData?> getCategoryRestaurantByid(
      {required int id}) async {
    try {
      final response = await _repositoryImpl.getCategoryRestaurantByid(
        id: id,
      );
      return response.data;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }
}

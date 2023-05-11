import 'package:dio/dio.dart';

import '../../../../models/we_service/restaurant/category_response.dart';
import '../../../../models/we_service/restaurant/menu_category_response.dart';
import '../../../../models/we_service/restaurant/menu_optional_response.dart';
import '../../../../models/we_service/restaurant/menu_response.dart';
import '../../../../models/we_service/restaurant/merchant_response.dart';
import '../../../../models/we_service/restaurant/table_restaurant_response.dart';
import '../../../../models/we_service/restaurant/zone_response.dart';

class RestaurantRepositoryImpl {
  Dio dio;

  RestaurantRepositoryImpl(this.dio);

  /// Merchant
  Future<MerchantResponse> getMerchantRestaurant(
      {required int categoryId}) async {
    final response = await dio.get('restaurant/', queryParameters: {
      'merchant_id': categoryId,
    });
    return MerchantResponse.fromJson(response.data);
  }

  /// Merchant by ID
  Future<MerchantIdResponse> getMerchantRestaurantByid(
      {required int id}) async {
    final response = await dio.get('restaurant/$id');
    return MerchantIdResponse.fromJson(response.data);
  }

  /// Menu
  Future<MenuResponse> getMenuRestaurant({required num merchantId}) async {
    final response = await dio.get('restaurant/menu', queryParameters: {
      'merchant_id': merchantId,
    });
    return MenuResponse.fromJson(response.data);
  }

  /// Menu by ID
  Future<MenuIdResponse> getMenuRestaurantByid({required int id}) async {
    final response = await dio.get('restaurant/menu/$id');
    return MenuIdResponse.fromJson(response.data);
  }

  /// Menu Category
  Future<MenuCategoryResponse> getMenuCategoryRestaurant(
      {required num merchantId}) async {
    final response =
        await dio.get('restaurant/menu-category', queryParameters: {
      'merchant_id': merchantId,
    });
    return MenuCategoryResponse.fromJson(response.data);
  }

  /// Menu Category by ID
  Future<MenuCategoryIdResponse> getMenuCategoryRestaurantByid(
      {required int id}) async {
    final response = await dio.get('restaurant/menu-category/$id');
    return MenuCategoryIdResponse.fromJson(response.data);
  }

  /// Menu Optional by ID
  Future<MenuOptionalResponse> getMenuOptionalRestaurantByid(
      {required int id}) async {
    final response = await dio.get('restaurant/menu-optional/$id');
    return MenuOptionalResponse.fromJson(response.data);
  }

  /// Zone
  Future<ZoneResponse> getZoneRestaurant({required int merchantId}) async {
    final response = await dio.get('restaurant/zone', queryParameters: {
      'merchant_id': merchantId,
    });
    return ZoneResponse.fromJson(response.data);
  }

  /// Zone by ID
  Future<ZoneIdResponse> getZoneRestaurantByid({required int id}) async {
    final response = await dio.get('restaurant/zone/$id');
    return ZoneIdResponse.fromJson(response.data);
  }

  /// Table
  Future<TableRestaurantResponse> getTableRestaurant(
      {required int zoneId}) async {
    final response = await dio.get('restaurant/table', queryParameters: {
      'zone_id': zoneId,
    });
    return TableRestaurantResponse.fromJson(response.data);
  }

  /// Table by ID
  Future<TableIdRestaurantResponse> getTableRestaurantByid(
      {required int id}) async {
    final response = await dio.get('restaurant/table/$id');
    return TableIdRestaurantResponse.fromJson(response.data);
  }

  /// Category
  Future<CategoryRestaurantResponse> getCategoryRestaurant() async {
    final response = await dio.get('restaurant/category/');
    return CategoryRestaurantResponse.fromJson(response.data);
  }

  /// Category by ID
  Future<CategoryIdRestaurantResponse> getCategoryRestaurantByid(
      {required int id}) async {
    final response = await dio.get('restaurant/category/$id');
    return CategoryIdRestaurantResponse.fromJson(response.data);
  }
}

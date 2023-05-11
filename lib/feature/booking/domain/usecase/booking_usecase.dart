import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../models/error/error_response.dart';
import '../../../../models/we_service/booking/add_item_cart_request.dart';
import '../../../../models/we_service/booking/add_item_cart_response.dart';
import '../../../../models/we_service/booking/app_response.dart';
import '../../../../models/we_service/booking/booking_response.dart';
import '../../../../models/we_service/booking/booking_update_request.dart';
import '../../../../models/we_service/booking/item_booking_response.dart';
import '../../../../models/we_service/booking/item_in_cart_response.dart';
import '../repository/booking_repository.dart';

class BookingUseCase {
  final BookingRepositoryImpl _bookingRepositoryImpl;

  BookingUseCase(this._bookingRepositoryImpl);

  /// Item
  Future<List<ItemBookingData>> getItemBooking({required int bookingId}) async {
    try {
      final response = await _bookingRepositoryImpl.getItemBooking(
        bookingId: bookingId,
      );
      return response.data ?? [];
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Item by ID
  Future<ItemBookingData?> getItemBookingByid({required int id}) async {
    try {
      final response = await _bookingRepositoryImpl.getItemBookingByid(id: id);
      return response.data;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Item in Cart
  Future<ItemInCartData?> getItemInCartBooking({
    required int userId,
    required num merchantId,
  }) async {
    try {
      final response = await _bookingRepositoryImpl.getItemInCartBooking(
        userId: userId,
        merchantId: merchantId,
      );
      return response.data;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Item Create (Add to Cart)
  Future<AddUpdateItemCartResponse> addItemToCartBooking({
    required AddItemCartRequest request,
  }) async {
    try {
      final response = await _bookingRepositoryImpl.addItemToCartBooking(
        request: request,
      );

      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Item Update
  Future<AddUpdateItemCartResponse> updateItemCartBooking(
      {required int id, required AddItemCartRequest request}) async {
    try {
      final response = await _bookingRepositoryImpl.updateItemCartBooking(
        id: id,
        request: request,
      );

      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Item Delete
  Future<AppResponse> deletItemInCartBooking({required int id}) async {
    try {
      final response = await _bookingRepositoryImpl.deletItemInCartBooking(
        id: id,
      );

      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Booking
  Future<List<BookingData>?> getBooking({
    required int userId,
    required String merchantType,
  }) async {
    try {
      final response = await _bookingRepositoryImpl.getBooking(
        userId: userId,
        merchantType: merchantType,
      );
      return response.data ?? [];
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Booking by ID
  Future<BookingData?> getBookingByid({required int id}) async {
    try {
      final response = await _bookingRepositoryImpl.getBookingByid(id: id);
      return response.data;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Booking Update (Reserve)
  Future<AppResponse> updateBooking({
    required int bookingId,
    required BookingUpdateRequest request,
  }) async {
    try {
      final response = await _bookingRepositoryImpl.updateBooking(
        bookingId: bookingId,
        request: request,
      );

      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Booking Cancel
  Future<AppResponse> cancelBooking(
      {required int bookingId, required String message}) async {
    try {
      final response = await _bookingRepositoryImpl.cancelBooking(
        bookingId: bookingId,
        message: message,
      );

      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }

  /// Booking Place (Send Order)
  Future<AppResponse> sendBookingPlace({required int id}) async {
    try {
      final response = await _bookingRepositoryImpl.sendBookingPlace(id: id);

      return response;
    } on DioError catch (e) {
      printError(info: e.message!);
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }
}

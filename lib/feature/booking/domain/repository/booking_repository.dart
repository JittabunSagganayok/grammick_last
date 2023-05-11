import 'package:dio/dio.dart';

import '../../../../models/we_service/booking/add_item_cart_request.dart';
import '../../../../models/we_service/booking/add_item_cart_response.dart';
import '../../../../models/we_service/booking/app_response.dart';
import '../../../../models/we_service/booking/booking_response.dart';
import '../../../../models/we_service/booking/booking_update_request.dart';
import '../../../../models/we_service/booking/item_booking_response.dart';
import '../../../../models/we_service/booking/item_in_cart_response.dart';

class BookingRepositoryImpl {
  Dio dio;

  BookingRepositoryImpl(this.dio);

  /// Item
  Future<ItemBookingResponse> getItemBooking({required int bookingId}) async {
    final response = await dio.get('booking/item', queryParameters: {
      'booking_id': bookingId,
    });
    return ItemBookingResponse.fromJson(response.data);
  }

  /// Item by ID
  Future<ItemIdBookingResponse> getItemBookingByid({required int id}) async {
    final response = await dio.get('booking/item$id');
    return ItemIdBookingResponse.fromJson(response.data);
  }

  /// Item in Cart
  Future<ItemInCartResponse> getItemInCartBooking({
    required int userId,
    required num merchantId,
  }) async {
    final response = await dio.get('booking/item/cart', queryParameters: {
      'user_id': userId,
      'merchant_id': merchantId,
    });
    return ItemInCartResponse.fromJson(response.data);
  }

  /// Item Create (Add to Cart)
  Future<AddUpdateItemCartResponse> addItemToCartBooking({
    required AddItemCartRequest request,
  }) async {
    final response = await dio.post('booking/item/', data: request.toJson());
    return AddUpdateItemCartResponse.fromJson(response.data);
  }

  /// Item Update
  Future<AddUpdateItemCartResponse> updateItemCartBooking(
      {required int id, required AddItemCartRequest request}) async {
    final response = await dio.put('booking/item/$id', data: request.toJson());
    return AddUpdateItemCartResponse.fromJson(response.data);
  }

  /// Item Delete
  Future<AppResponse> deletItemInCartBooking({required int id}) async {
    final response = await dio.delete('booking/item/$id');
    return AppResponse.fromJson(response.data);
  }

  /// Booking
  Future<BookingResponse> getBooking({
    required int userId,
    required String merchantType,
  }) async {
    final response = await dio.get('booking/', queryParameters: {
      'user_id': userId,
      'merchant_type': merchantType,
    });
    return BookingResponse.fromJson(response.data);
  }

  /// Booking by ID
  Future<BookingIdResponse> getBookingByid({required int id}) async {
    final response = await dio.get('booking/$id');
    return BookingIdResponse.fromJson(response.data);
  }

  ///! Booking Update (Reserve)
  Future<AppResponse> updateBooking({
    required int bookingId,
    required BookingUpdateRequest request,
  }) async {
    final response = await dio.put(
      'booking/$bookingId',
      data: request.toJson(),
    );
    return AppResponse.fromJson(response.data);
  }

  ///! Booking Cancel
  Future<AppResponse> cancelBooking(
      {required int bookingId, required String message}) async {
    final response = await dio.post(
      'booking/cancel',
      data: {'booking_id': bookingId, 'message': message},
    );
    return AppResponse.fromJson(response.data);
  }

  ///! Booking Place (Send Order)
  Future<AppResponse> sendBookingPlace({required int id}) async {
    final response = await dio.put('booking/place/$id');
    return AppResponse.fromJson(response.data);
  }
}

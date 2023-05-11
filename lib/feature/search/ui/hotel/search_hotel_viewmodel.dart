import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:we_link/feature/booking/ui/checkin/booking_checkin_screen.dart';

class SearchHotelViewModel extends GetxController{

  BookingDateArgument? bookingDateArgument;

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  void setBookingDateArgument(BookingDateArgument arguments) {
    this.bookingDateArgument = arguments;

    startDateController.text = DateFormat('dd MMM').format(bookingDateArgument?.startDate ?? DateTime.now());
    endDateController.text = DateFormat('dd MMM').format(bookingDateArgument?.endDate ?? DateTime.now());
  }

}
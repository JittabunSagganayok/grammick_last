import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingCheckInViewModel extends GetxController {
  var totalDays = 0.obs;

  DateTime startDate = DateTime.now(), endDate = DateTime.now();

  bool allowSelectMultiple = true;

  void setStartDate(
    DateTime date,
  ) {
    startDate = date;
  }

  void setEndDate(
    DateTime date,
  ) {
    endDate = date;

    var duration = endDate.difference(startDate);

    if(allowSelectMultiple){
      totalDays.value = duration.inDays ?? 0;
    }else{
      totalDays.value = 1;
    }
  }

  String getFormatDate(
    DateTime date,
  ) {
    return DateFormat('dd MMM').format(date);
  }
}

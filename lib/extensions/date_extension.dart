import 'package:intl/intl.dart';

extension BuddhistDate on DateTime {
  String formatDopaDateRequest() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatDateTimeBooking() {
    return DateFormat('hh : mm dd/MM/yyyy').format(this);
  }

  String formatBuddhistDate() {
    return DateFormat('dd/MM/yyyy', 'th').formatInBuddhistCalendarThai(this);
  }

  String formatBuddhistMonth() {
    return DateFormat('MMMM yyyy', 'th').formatInBuddhistCalendarThai(this);
  }

  String formatDate() {
    return DateFormat('dd/MM/yyyy', 'th').format(this);
  }

  String formatBuddhistDateWithTime() {
    return DateFormat('dd/MM/yyyy HH:mm', 'th')
        .formatInBuddhistCalendarThai(this);
  }

  String formatBuddhistDateTimeNotification() {
    return DateFormat('dd/MM/yyyy HH:mm', 'th')
        .formatInBuddhistCalendarThai(add(Duration(hours: 7)));
  }

  String formatPaymentCreateDate() {
    return DateFormat('dd MMM yyyy', 'th').formatInBuddhistCalendarThai(this);
  }

  String formatPaymentCreateTime() {
    return DateFormat('HH:mm น.').format(this.add(Duration(hours: 7)));
  }
}

extension BuddhistCalendarFormatter on DateFormat {
  String formatInBuddhistCalendarThai(DateTime dateTime) {
    if (this.pattern!.contains('y')) {
      var buddhistDateTime = DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond);

      // This path check DateFormat's locale, which already support Thai's one.
      // If you want to contribute, there are several countries that also use Buddhist calendar.
      // So you can help me correct their format by update the code below.
      // Reference: https://en.wikipedia.org/wiki/Buddhist_calendar
      // - Thailand
      // - Cambodia
      // - Laos
      // - MyanMar
      // - Sri Lanka
      // - Malaysia
      // - Singapore
      if (this.locale.contains('th') || this.locale.contains('TH')) {
        var normalYear = buddhistDateTime.year;
        var dateTimeString =
            this.format(buddhistDateTime).replaceAll('ค.ศ.', 'พ.ศ.');
        dateTimeString = dateTimeString.replaceAll(
            normalYear.toString(), (normalYear + 543).toString());
        return dateTimeString;
      } else {
        var result = this.format(buddhistDateTime);
        return result;
      }
    }
    return this.format(dateTime);
  }
}

extension BuddhistCalendarDateTime on DateTime {
  int get yearInBuddhistCalendar {
    return this.year + 543;
  }
}

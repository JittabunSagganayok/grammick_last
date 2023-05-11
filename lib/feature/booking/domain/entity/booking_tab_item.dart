import 'dart:ui';

import 'package:we_link/constant/colosrConstants.dart';

class BookingTabItem {
  String label;
  num badge;
  Color backgroundActiveColor;
  Color backgroundDefaultColor;
  Color labelActiveColor;
  Color labelDefaultColor;
  bool selected;

  BookingTabItem({
    required this.label,
    required this.badge,
    this.selected = false,
    this.backgroundActiveColor = bookingTabActiveColor,
    this.backgroundDefaultColor = bookingTabDefaultColor,
    this.labelActiveColor = bookingTabLabelActiveColor,
    this.labelDefaultColor = bookingTabLabelDefaultColor,
  });
}

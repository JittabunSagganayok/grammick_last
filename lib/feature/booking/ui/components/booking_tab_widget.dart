import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/feature/booking/domain/entity/booking_tab_item.dart';

import '../../../../constant/colosrConstants.dart';

class BookingTabWidget extends StatelessWidget {
  BookingTabItem item;
  Function() onClicked;

  BookingTabWidget({
    required this.item,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: badges.Badge(
        showBadge: item.badge > 0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              primary: item.selected
                  ? item.backgroundActiveColor
                  : item.backgroundDefaultColor),
          onPressed: () {
            onClicked.call();
          },
          child: Text(
            item.label,
            style: GoogleFonts.kanit(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: item.selected
                  ? item.labelActiveColor
                  : item.labelDefaultColor,
            ),
          ),
        ),
        badgeContent: Text(
          item.badge.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: badgeRedColor,
          shape: badges.BadgeShape.circle,
        ),
      ),
    );
  }
}

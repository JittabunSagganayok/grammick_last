import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/gridview/grid_view_fix_height.dart';

class BookingServiceInfoSection extends StatelessWidget {
  Function(BookingServiceInfoItemType) onClicked;

  List<BookingServiceInfoItem> services = [];

  BookingServiceInfoSection(
    this.services,
    this.onClicked,
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: services.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      gridDelegate: const GridViewFixHeight(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        height: 96,
      ),
      itemBuilder: (context, index) {
        final item = services[index];
        return InkWell(
          onTap: () {
            onClicked.call(item.type);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: item.backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.iconColor,
                  ),
                  child: SvgPicture.asset(
                    item.icon,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: const Color(
                      0xff3D3D3D,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class BookingServiceInfoItem {
  String title;
  String icon;
  Color iconColor;
  Color backgroundColor;
  BookingServiceInfoItemType type;

  BookingServiceInfoItem({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.type,
  });
}

enum BookingServiceInfoItemType { POLICY, TERM_AND_COND, DIRECTION }

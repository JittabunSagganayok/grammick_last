import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/gridview/grid_view_fix_height.dart';
import '../../detail/hotel_detail_viewmodel.dart';

class HotelFacilitiesServiceSection extends StatelessWidget {
  List<FacilitiesItem> facilitiesItem = [];

  HotelFacilitiesServiceSection(this.facilitiesItem);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: GridViewFixHeight(
        crossAxisCount: 6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        height: 80,
      ),
      itemCount: facilitiesItem.length,
      itemBuilder: (context, index) {
        final item = facilitiesItem[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: SvgPicture.asset(item.icon),
              decoration: BoxDecoration(
                color: Color(0xffEEEEEE),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              item.label,
              style: GoogleFonts.kanit(
                fontSize: 9,
                fontWeight: FontWeight.w300,
                color: Color(
                  0xff9D9D9D,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

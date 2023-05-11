import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/gridview/grid_view_fix_height.dart';

class HotelDetailGalleryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      itemCount: 5,
      gridDelegate: GridViewFixHeight(
        crossAxisCount: 5,
        height: 64,
        crossAxisSpacing: 16,
      ),
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        final lastItem = index == 4;
        return ItemHotelDetailGallery(lastItem);
      },
    );
  }
}

class ItemHotelDetailGallery extends StatelessWidget {
  bool lastItem;

  ItemHotelDetailGallery(this.lastItem);

  @override
  Widget build(BuildContext context) {
    if (lastItem) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ExtendedImage.asset(
              'assets/mock/mock_hotel_detail.jpg',
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff8C000000),
            ),
            child: Text(
              '+5',
              style: GoogleFonts.kanit(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExtendedImage.asset(
          'assets/mock/mock_hotel_detail.jpg',
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}

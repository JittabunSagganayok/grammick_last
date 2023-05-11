import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/feature/we_service/ui/we_service_viewmodel.dart';

class ItemGalleryWithBottomTextWidget extends StatelessWidget {
  WeServiceItemModel item;

  ItemGalleryWithBottomTextWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: ExtendedImage.asset(item.image),
          borderRadius: BorderRadius.circular(24),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff131313).withAlpha(0),
                    Color(0xff131313).withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Text(
              item.title,
              style: GoogleFonts.kanit(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            width: double.infinity,
            height: 48,
          ),
        ),
      ],
    );
  }
}

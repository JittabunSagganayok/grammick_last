import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSpecialReserveServiceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: ExtendedImage.asset(
              'assets/mock/mock_special_package.png',
              height: 176,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Aroma promotions",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                              Text(
                                "900 ฿",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff564FF0),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Kanit'),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon_star_yellow.svg'),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '4.5',
                                style: GoogleFonts.kanit(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  'The Mall ... 4.3 km',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.kanit(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff6C6C6C),
                                  ),
                                ),
                              ),
                              Text(
                                '2,500 ฿',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.kanit(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xffA3A3A3),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

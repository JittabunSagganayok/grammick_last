import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/shared/text/title_header_section.dart';

class ServiceHotDealSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: TitleHeaderSection(title: 'Hots Deal'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                ExtendedImage.asset('assets/mock/mock_hotel_hot_deal.png'),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icon_play_video.svg',
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'The Bliss cross more boraders to open your mind',
                        style: GoogleFonts.kanit(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff545454)),
                      ),
                    ),
                    Icon(Icons.info_outline)
                  ],
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem',
                  style: GoogleFonts.kanit(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: subtitleLightGrayColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}

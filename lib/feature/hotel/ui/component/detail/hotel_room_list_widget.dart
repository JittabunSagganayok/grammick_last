import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/feature/hotel/ui/room/room_detail_screen.dart';
import 'package:we_link/shared/text/app_text_border.dart';

import '../../../../../constant/colosrConstants.dart';
import '../../../../../shared/dash/dash_widget.dart';
import '../../../../../shared/gridview/grid_view_fix_height.dart';
import '../../detail/hotel_detail_viewmodel.dart';

class HotelRoomListWidget extends StatelessWidget {
  List<FacilitiesItem> roomOption = [];

  HotelRoomListWidget(this.roomOption);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16),
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoomDetailGalleryWidget(),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Standard Twin Room',
                  style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  gridDelegate: GridViewFixHeight(
                      crossAxisCount: 3,
                      height: 40,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemCount: roomOption.length,
                  itemBuilder: (context, index) {
                    final item = roomOption[index];
                    return HotelOptionWidget(
                      item.icon,
                      item.label,
                    );
                  },
                ),
                Container(
                  child: DashWidget(
                    height: 1,
                    color: Color(0xffCACACA),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('1,893 ฿',
                                  style: GoogleFonts.kanit(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                width: 4,
                              ),
                              Text('/ Nights',
                                  style: GoogleFonts.kanit(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Text('ราคาเป็นไปตามเงื่อนไข',
                              style: GoogleFonts.kanit(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: Color(
                                  0xff6C6C6C,
                                ),
                              )),
                        ],
                      )),
                      SizedBox(
                        width: 120,
                        child: InkWell(
                          onTap: (){
                            Get.to(RoomDetailScreen(),transition: Transition.rightToLeft);
                          },
                          child: AppTextBorder(
                            title: 'Reserve',
                            fontColor: Color(0xff564FF0),
                            backgroundColor: Color(0xffECEBFF),
                            borderColor: Color(0xff564FF0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
      separatorBuilder: (context, index) => Divider(
        height: 16,
        color: Colors.transparent,
      ),
      itemCount: 5,
    );
  }
}

class RoomDetailGalleryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
            child: ExtendedImage.asset(
              'assets/mock/mock_hotel_gallery.png',
              fit: BoxFit.cover,
              height: 160,
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
              child: ExtendedImage.asset(
                'assets/mock/mock_hotel_galery2.png',
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HotelOptionWidget extends StatelessWidget {
  String icon;
  String title;

  HotelOptionWidget(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: appBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xffEDEDED),
                width: 1,
              )),
          child: SvgPicture.asset(icon),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.kanit(
              fontSize: 11,
              fontWeight: FontWeight.w300,
            ),
          ),
        )
      ],
    );
  }
}

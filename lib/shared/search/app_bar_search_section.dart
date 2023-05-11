import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/colosrConstants.dart';
import '../../feature/search/ui/hotel/search_hotel_screen.dart';

class AppBarSearchSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 60,
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width * 1,
            height: 20,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: new Container(
                height: 55,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: new BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 6, right: 6),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    readOnly: true,
                    onTap: () {
                      Get.to(
                        SearchHotelScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 8),
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            )),
                        border: InputBorder.none),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

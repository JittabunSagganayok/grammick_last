import 'package:flutter/material.dart';
import 'package:we_link/components/home/homeComponents/home_menu_section.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class searchMenu extends StatelessWidget {
  const searchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 150,
      // constraints: maxHeightContain,
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 150,
              padding: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: yellDarkColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: HomeMenuSection()),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 25,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

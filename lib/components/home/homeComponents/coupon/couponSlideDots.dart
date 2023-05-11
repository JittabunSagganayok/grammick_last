import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';

class couponSlideDots extends StatelessWidget {
  bool isActive;
  couponSlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: isActive ? 8 : 8,
      width: isActive ? 25 : 8,
      decoration: BoxDecoration(
        color: isActive ? yellowColor : Color(0xFFC7C7CC),
        // shape: isActive ? BoxShape.rectangle : BoxShape.circle,
       borderRadius:  BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
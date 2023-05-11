import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';

class slideDots extends StatelessWidget {
  bool isActive;
  slideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 11 : 8,
      width: isActive ? 11 : 8,
      decoration: BoxDecoration(
        color: isActive ? yellowColor : Color(0xFFC7C7CC),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
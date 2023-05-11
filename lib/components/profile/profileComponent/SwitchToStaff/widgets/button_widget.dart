import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color bgColor, fontColor;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;

  // ignore: use_key_in_widget_constructors
  const ButtonWidget(
      {required this.onPressed,
      required this.title,
      this.bgColor = const Color(0XFFFDCD03),
      this.fontColor = const Color(0XFF363636),
      this.height = 50,
      required this.width,
      this.radius = 8,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: bgColor,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.kanit(
                fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextBorder extends StatelessWidget {
  String title;
  Color borderColor;
  Color backgroundColor;
  Color fontColor;
  String? prefixIcon;
  bool underlineTextView;

  double? fontSize;

  AppTextBorder({
    required this.title,
    required this.borderColor,
    required this.backgroundColor,
    required this.fontColor,
    this.prefixIcon,
    this.underlineTextView = false,
  });

  AppTextBorder.withFontSize({
    required this.title,
    required this.borderColor,
    required this.backgroundColor,
    required this.fontColor,
    required this.fontSize,
    this.prefixIcon,
    this.underlineTextView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(
                prefixIcon ?? "",
              ),
            )
          ],
          Text(
            title,
            style: GoogleFonts.kanit(
              fontSize: fontSize ?? 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
              color: fontColor,
              decoration: underlineTextView ? TextDecoration.underline: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

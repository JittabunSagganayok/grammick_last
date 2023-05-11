import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';

class SubtitleHeaderSection extends StatelessWidget {
  String subtitle;

  SubtitleHeaderSection({
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: GoogleFonts.kanit(
        color: subtitleLightGrayColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

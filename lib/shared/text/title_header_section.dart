import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHeaderSection extends StatelessWidget {
  String title;

  TitleHeaderSection({
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: GoogleFonts.kanit(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      );
}

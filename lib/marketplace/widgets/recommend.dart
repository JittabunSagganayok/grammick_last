import 'package:flutter/material.dart';
import 'package:we_link/marketplace/fonts/utils.dart';

//recommend readmore
class RecommendReadmore extends StatelessWidget {
  const RecommendReadmore({
    super.key,
    required this.ffem,
    required this.fem,
  });

  final double ffem;
  final double fem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommend',
          style: SafeGoogleFont(
            'Kanit',
            fontSize: 15 * ffem,
            fontWeight: FontWeight.w500,
            height: 1.495 * ffem / fem,
            color: const Color(0xff000000),
          ),
        ),
        Text(
          'View more',
          style: SafeGoogleFont(
            'Kanit',
            fontSize: 12 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.495 * ffem / fem,
            color: const Color(0xff3d79d2),
          ),
        ),
      ],
    );
  }
}

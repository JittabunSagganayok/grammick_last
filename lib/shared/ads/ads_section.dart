import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AdsSection extends StatelessWidget {
  final PageController pageController = PageController(
    viewportFraction: 0.93,
  );

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: ExtendedImage.asset(
              'assets/mock/mock_restaurant_ads.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: 3,
    );
  }
}

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:we_link/constant/colosrConstants.dart';

class BannerWidget extends StatelessWidget {
  List<String> banners;
  PageController pageController = PageController();
  Function onClicked;

  BannerWidget({
    required this.banners,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 120,
      child: Stack(
        children: [
          PageView.builder(
              itemCount: banners.length,
              controller: pageController,
              itemBuilder: (context, index) {
                final item = banners[index];
                return InkWell(
                  onTap: () {
                    onClicked.call();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ExtendedImage.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: JumpingDotEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: blackColor,
                    dotColor: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

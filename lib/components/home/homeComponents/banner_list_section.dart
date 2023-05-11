import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/models/banner/banner_list_response.dart' as banner;

class BannerListSection extends StatefulWidget {
  List<banner.Banner> bannerList = [];

  BannerListSection(this.bannerList);

  @override
  State<BannerListSection> createState() => _BannerListSectionState();
}

class _BannerListSectionState extends State<BannerListSection> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              height: 145,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: widget.bannerList
              .map((item) => Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Center(
                        child: Image.network(
                          item.picture ?? "",
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          carouselController: _controller,
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: widget.bannerList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  // width:_current == entry.key ? 20 : 8.0,
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.values
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ));
  }
}

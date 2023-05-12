import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:we_link/marketplace/data/data.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Map<String, dynamic>> imageList = imagesliderList;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      width: 333 * fem,
      height: 116 * fem,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              //print(currentIndex);
            },
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => SizedBox(
                      width: double.infinity,
                      height: 116 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13 * fem),
                          border: Border.all(color: const Color(0xffefeff4)),
                          color: const Color(0x4c000000),
                          image: DecorationImage(
                            //scale: 0.1,
                            alignment: Alignment(0, -0.3),
                            fit: BoxFit.cover,

                            image: AssetImage(
                              item['image_path'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 3,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 7 : 7,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: currentIndex == entry.key
                            ? Colors.orange
                            : Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliderScreendetail extends StatefulWidget {
  const SliderScreendetail({super.key, required this.imagedata});

  final imagedata;

  @override
  State<SliderScreendetail> createState() => _SliderScreendetailState();
}

class _SliderScreendetailState extends State<SliderScreendetail> {
  List<Map<String, dynamic>> imageList = imagesliderList;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  void initState() {
    setState(() {
      imageList = widget.imagedata;

      super.initState();
    });
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      width: 375 * fem,
      height: 314 * fem,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              //print(currentIndex);
            },
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => SizedBox(
                      width: double.infinity,
                      height: 314 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(13 * fem),
                          // border: Border.all(color: const Color(0xffefeff4)),
                          // color: const Color(0x4c000000),
                          image: DecorationImage(
                            //scale: 0.1,
                            //alignment: Alignment(0, -0.3),
                            fit: BoxFit.cover,

                            image: AssetImage(
                              item['image_path'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 1.2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 7 : 7,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: currentIndex == entry.key
                            ? Colors.orange
                            : Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

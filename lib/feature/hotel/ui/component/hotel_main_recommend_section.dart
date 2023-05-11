import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../../../../components/home/homeComponents/coupon_list_section.dart';
import '../../../../constant/colosrConstants.dart';
import '../../../../shared/text/subtitle_header_section.dart';
import '../../../../shared/text/title_header_section.dart';
import '../detail/hotel_detail_screen.dart';
// import 'hotel_main_best_we_stay_section.dart';

class HotelMainRecommendSection extends StatelessWidget {

  final PageController pageController = PageController(
    viewportFraction: 0.93,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ServiceHotelRecommendTitleWidget(onClicked: () {
              //
            }),
            Container(
              height: (MediaQuery.of(context).size.height - 390),
              margin: const EdgeInsets.only(top: 0),
              child: ListView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return ItemHotelListWidget();
                  /*
                  return InkWell(
                    onTap: () {
                      Get.to(
                        HotelDetailScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: ItemHotelListWidget(),
                  );
                  */
                },
                itemCount: 2,
              ),
            ),
            /*
            Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              child: CouponListSection(const []),
            ),
            // const HotelMainBestWeStaySection(),
            */
          ],
        ),
      ),
    );
  }

}

class ServiceHotelRecommendTitleWidget extends StatelessWidget {

  Function onClicked;

  ServiceHotelRecommendTitleWidget({
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TitleHeaderSection(
        title: 'Recommend for you',
      ),
      subtitle: SubtitleHeaderSection(
        subtitle: 'Place near by',
      ),
      trailing: TextButton(
        onPressed: () {
          // 
        },
        child: Text(
          'See All',
          style: GoogleFonts.kanit(
            fontSize: 11,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF546297),
          ),
        ),
      ),
    );
  }

}

class ItemHotelListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      elevation: 0,
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(
                HotelDetailScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: ServiceHotelGalleryWidget(),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'KriHara Plearn',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: titleBlackColor,
                    ),
                  ),
                ),
                Text(
                  '2,500 ฿',
                  style: GoogleFonts.kanit(
                    fontSize: 9,
                    fontWeight: FontWeight.w300,
                    color: priceRedColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/icon_map_direction.svg'),
                const SizedBox(width: 4),
                Text(
                  '123, Kaoyai s,Royale Prince...',
                  style: GoogleFonts.kanit(
                    fontSize: 13,
                    color: subtitleGrayColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Text(
                    '1,893 ฿',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.kanit(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: priceBlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/icon_star_yellow.svg'),
                const SizedBox(width: 4),
                Text(
                  '4.5',
                  style: GoogleFonts.kanit(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  child: Text(
                    'ราคาเป็นไปตามเงื่อนไข',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.kanit(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff6C6C6C),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      HotelDetailScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF189B58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'View',
                    style: GoogleFonts.kanit(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ServiceHotelGalleryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
            ),
            child: ExtendedImage.asset(
              'assets/mock/mock_hotel_gallery.png',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
        ),
        const SizedBox(width: 2),
        Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
              ),
              child: ExtendedImage.asset(
                'assets/mock/mock_hotel_galery2.png',
                width: 99,
                height: 99,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            ExtendedImage.asset(
              'assets/mock/mock_hotel_gallery3.png',
              width: 99,
              height: 99,
            ),
          ],
        ),
      ],
    );
  }
}

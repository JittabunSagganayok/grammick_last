import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/shared/text/title_header_section.dart';

import '../../../../constant/colosrConstants.dart';
import '../../../../shared/recommend/item_service_recommend_widget.dart';

class HotelMainBestWeStaySection extends StatelessWidget {
  const HotelMainBestWeStaySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(
        leading: TitleHeaderSection(
          title: 'The Best WeStay',
        ),
      ),
      Container(
        height: 216,
        child: ListView.separated(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          primary: false,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.transparent, endIndent: 16),
          itemBuilder: (BuildContext context, int index) {
            return ItemServiceRecommendWidget();
          },
        ),
      ),
    ]));
  }
}

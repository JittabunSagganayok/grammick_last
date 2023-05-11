import 'dart:async';

import 'package:flutter/material.dart';
import 'package:we_link/components/home/homeComponents/coupon/couponSlideDots.dart';
import 'package:we_link/components/home/homeComponents/coupon/couponSlideItems.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/coupon/coupon_list_response.dart';

class CouponListSection extends StatefulWidget {
  List<Coupon> couponList = [];
  Function(Coupon)? onSaveCoupon;

  CouponListSection(
    this.couponList, {
    this.onSaveCoupon,
  });

  @override
  State<CouponListSection> createState() => _CouponListSectionState();
}

class _CouponListSectionState extends State<CouponListSection> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    // Timer.periodic(Duration(seconds: 5), (Timer timer) {
    //   if (_currentPage < 2) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    //
    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: maxHeightContain,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          if (widget.couponList.isNotEmpty)
            SizedBox(
              height: 100,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: widget.couponList.length,
                    itemBuilder: (ctx, i) => CouponSlideItems(
                      widget.couponList[i],
                      onSaveCoupon: widget.onSaveCoupon,
                    ),
                  ),
                ],
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.couponList.length; i++)
                  if (i == _currentPage)
                    couponSlideDots(true)
                  else
                    couponSlideDots(false)
              ],
            ),
          )
        ],
      ),
    );
  }
}

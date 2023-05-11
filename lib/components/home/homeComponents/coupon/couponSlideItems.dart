import 'package:flutter/material.dart';
import 'package:we_link/components/alert/couponDetail.dart';
import 'package:we_link/components/home/homeComponents/coupon/saveCouponButton.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/coupon/coupon_list_response.dart';

class CouponSlideItems extends StatelessWidget {
  Coupon coupon;
  Function(Coupon)? onSaveCoupon;

  CouponSlideItems(
    this.coupon, {
    this.onSaveCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCouponDetail(
        context,
        coupon,
        onSaveCoupon: onSaveCoupon,
      ),
      child: Container(
        constraints: maxHeightContain,
        width: MediaQuery.of(context).size.width * 1,
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        padding: EdgeInsets.fromLTRB(12, 7, 13, 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [payMentShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(coupon.picture ?? ""),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 19, right: 16, bottom: 5),
                    child: Text(
                      '${coupon.name ?? ""} ${coupon.discountValue ?? ''}${coupon.discountUnit ?? ""}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Kanit',
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 19, right: 16),
                    child: Text(
                      'คุณสามารถเก็บคูปองเพิ่มเติมได้',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Kanit',
                          color: Color(0xFF9E9E9E)),
                    ),
                  ),
                ],
              ),
            ),

            if (coupon.isSaved == false)... [
              saveCouponButton(coupon),
            ]
            // SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   height: 60,
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/models/coupon/coupon_list_response.dart';

class saveCouponButton extends StatefulWidget {
  Coupon coupon;

  saveCouponButton(this.coupon);

  @override
  State<saveCouponButton> createState() => _saveCouponButtonState();
}

class _saveCouponButtonState extends State<saveCouponButton> {

  @override
  Widget build(BuildContext context) {
    var coupon = widget.coupon;
    return Container(
      height: 30,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            backgroundColor: coupon.isSaved == true ? Color(0xFFFFCA38) : Color(0xFF189B58),
            textStyle: TextStyle(fontSize: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
            side: BorderSide(
              width: 1.0,
              color: coupon.isSaved == true ? Color(0xFFFDB824) : Color(0xFF189B58),
            ),
          ),
          onPressed: () async {
            Dio dio = appModule.get();

            await dio.post('coupons', data: {
              "coupon_id": widget.coupon.id,
            });

            setState(() {
              coupon.isSaved = coupon.isSaved == false;
            });
          },
          child: Container(
              child: Text.rich(
            TextSpan(
              text: coupon.isSaved == true ? "เก็บโค้ดแล้ว" : 'เก็บโค้ด',
              style: TextStyle(
                  color: coupon.isSaved == true ? Color(0xFFF8550F) : Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Kanit'),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ))),
    );
  }
}

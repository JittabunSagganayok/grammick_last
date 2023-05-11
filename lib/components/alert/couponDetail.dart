import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/coupon/coupon_list_response.dart';

void showCouponDetail(
  BuildContext context,
  Coupon coupon, {
  Function(Coupon)? onSaveCoupon,
}) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        // margin: EdgeInsets.all(20),
        constraints: maxHeightContain,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 15, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 75,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0xFFECECEC),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Image.network(
                        coupon.picture ?? "",
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                          '${coupon.discountValue}${coupon.discountUnit} คูปองส่วนลด',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 21),
                Text('Detail',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF9E9E9E),
                    )),
                SizedBox(height: 8),
                Text(coupon.description ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF545454),
                    )),
                SizedBox(height: 22),
                Row(
                  children: [
                    Container(
                      height: 24,
                      width: 66,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text('For you',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                          text: "date : ",
                          style: TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Kanit'),
                          children: [
                            TextSpan(
                              text: DateFormat("dd / MM / yyyy").format(
                                  DateTime.parse(coupon.createdDt ?? "")),
                              style: TextStyle(
                                  color: Color(0xFF9E9E9E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Kanit'),
                            ),
                          ]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFF189B58),
                      textStyle: TextStyle(fontSize: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    onPressed: () async {
                      onSaveCoupon?.call(coupon);

                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'เก็บโค้ด',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                ),
                SizedBox(height: 21),
              ],
            ),
          ),
        ),
      );
    },
  );
}

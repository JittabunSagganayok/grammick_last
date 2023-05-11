import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import '../../../payment/ui/payment_method_screen.dart';

class BookingConfirmationPaymentMethodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment method',
          style: GoogleFonts.kanit(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Color(0xff8E8E8E)),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(child: PaymentMethodButton(
              label: 'Credit / Debit',
              leading: 'assets/icon_mastercard.svg',
              trailing: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xff424242),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icon_arrow_yellow.svg',
                ),
              ),
              textColor: Colors.black,
              backgroundColor: Color(0xffF4F4F4),
              borderColor: Color(0xffF4F4F4),
              circleColor: Color(0xff424242),
              onClicked: () {
                Get.to(PaymentMethodScreen(),transition: Transition.downToUp);
              },
            )),
            SizedBox(
              width: 8,
            ),
            Expanded(child: PaymentMethodButton(
              label: 'ride50Freeiks...',
              leading: 'assets/icon_coupon.svg',
              trailing: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xff7EF07C),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icon_arrow_green.svg',
                ),
              ),
              textColor: Color(0xff22A876),
              backgroundColor: Color(0xffCEFFCD),
              borderColor: Color(0xff83D79B),
              circleColor: Color(0xff7EF07C),
              onClicked: () {
                Get.to(PromotionScreen(),transition: Transition.downToUp);
              },
            )),
          ],
        )
      ],
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  String label;
  String leading;
  Widget trailing;
  Color textColor, backgroundColor, borderColor, circleColor;
  Function onClicked;

  PaymentMethodButton({
    required this.label,
    required this.leading,
    required this.trailing,
    required this.onClicked,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          side: BorderSide(
            color: borderColor,
            width: 1,
          )),
      onPressed: () {
        onClicked();
      },
      child: Row(
        children: [
          SvgPicture.asset(leading),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                  fontSize: 13, fontWeight: FontWeight.w400, color: textColor),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          trailing,
        ],
      ),
    );
  }
}

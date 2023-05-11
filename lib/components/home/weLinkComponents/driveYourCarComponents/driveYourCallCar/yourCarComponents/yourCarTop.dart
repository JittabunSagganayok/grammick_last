import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';

class yourCarTop extends StatelessWidget {
  const yourCarTop({Key? key, this.DriveYourArrival, this.DriveYourRideBegan}) : super(key: key);
  final String? DriveYourArrival;
  final String? DriveYourRideBegan;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(right: 20, left: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: DriveYourArrival == 'DriveYourArrival'
              ? yellowColor
              : Color(0xFF40C255),
          textStyle: TextStyle(fontSize: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(
            width: 0.0,
            color: DriveYourArrival == 'DriveYourArrival'
                ? yellowColor
                : Color(0xFF40C255),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             DriveYourRideBegan == 'DriveYourRideBegan' ? Container() :
            DriveYourArrival == 'DriveYourArrival' ? Container() :
            Container(
              // margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.contain,
                height: 34,
                width: 38,
              ),
            ),
            Container(
                child: Text.rich(
              TextSpan(
                  text: DriveYourRideBegan == 'DriveYourRideBegan' ? 'The ride began' : DriveYourArrival == 'DriveYourArrival' ? 'The driver is waiting for you' : "Congratulations on meeting the driver",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Kanit')),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ),
    );
  }
}

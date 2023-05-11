import 'package:flutter/material.dart';

class driverToGoTop extends StatelessWidget {
  const driverToGoTop({Key? key, this.atStoreTop}) : super(key: key);
  final String? atStoreTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      // width: 100,
      margin: EdgeInsets.only(right: 20, left: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: atStoreTop == 'atStoreTop' ? Color(0xFFFDCD03) :  Color(0xFF40C255),
          textStyle: TextStyle(fontSize: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(
            width: 1.0,
            color: atStoreTop == 'atStoreTop' ? Color(0xFFFDCD03) :  Color(0xFF40C255),
          ),
        ),
        // onPressed: () => addAddressSuccess(context),
        onPressed: () {},
        child: Row(
          children: [
            Container(
              // margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.contain,
                height: 34,
                width: 38,
              ),
            ),
            Expanded(
              child: Container(
                  child: Text.rich(
                TextSpan(
                    text: atStoreTop == 'atStoreTop' ? 'The driver has reached the pickup point.' : "Congratulations on meeting the driver",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Kanit')),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

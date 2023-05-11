import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/confirmCallCar.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

void promotionDetail(BuildContext context) {
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
                      child: Image.asset(
                        'assets/images/code1.png',
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: 10),
                      child: Text('60฿ Discount promotion',
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
                Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
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
                        borderRadius: BorderRadius.all(Radius.circular(7),
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
                              text: "20 / 02 / 2022",
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
                      backgroundColor: blackColor,
                      textStyle: TextStyle(fontSize: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      // side: BorderSide(
                      //   width: 0.0,
                      //   color: yellowColor,
                      // ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => confirmCallCar()),
                        // );
                      },
                    child: Text(
                      'Use it',
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

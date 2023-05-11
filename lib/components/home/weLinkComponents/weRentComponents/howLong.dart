import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/howLongCar.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

var car = [
  {
    "title": "Car - 2 Hours (within city)",
    "type": "Safely",
    "subtitle": "900 Bath",
    "time": "9-13 Min",
    "image": "assets/images/car_3.png"
  },
  {
    "title": "Motor Bike - 2 Hours (within city)",
    "type": "Regular",
    "subtitle": "900 Bath",
    "time": "9-13 Min",
    "image": "assets/images/car_2.png"
  },
  {
    "title": "Van - 4 Hours (outside city)",
    "type": "Outside city",
    "subtitle": "900 Bath",
    "time": "9-13 Min",
    "image": "assets/images/car_1.png"
  },
];

void howLong(BuildContext context) {
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
            top: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            // margin: EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 24, 20, 0),
                  child: Text('Rent a car, hire a driver',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
                  child:
                      Text('Displayed fare includes fuel and driver charges.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9A9A9A),
                          )),
                ),
                howLongCar(),
                SizedBox(height: 40),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width * 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: yellowColor,
                      textStyle: TextStyle(fontSize: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      side: BorderSide(
                        width: 0.0,
                        color: yellowColor,
                      ),
                    ),
                    // onPressed: () => addAddressSuccess(context),
                    onPressed: () {},
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Color(0xFF363636),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

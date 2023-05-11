import 'package:flutter/material.dart';
import 'package:we_link/components/home/weAssistantComponents/callWeLink.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

void orderDetailAlert(BuildContext context) {
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
            margin: EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 10),
                  child: Text('Check order details',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                SizedBox(height: 21),
                Divider(
                  color: Color(0xFFEEEEEE),
                  thickness: 1,
                ),
                SizedBox(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: 10),
                      child: Text('70',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(' ฿',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFA9A9A9),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 21),
                Divider(
                  color: Color(0xFFEEEEEE),
                  thickness: 1,
                ),
                SizedBox(height: 21),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 1,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xFFF4F4F4),
                              textStyle: TextStyle(fontSize: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              // side: BorderSide(
                              //   width: 0.0,
                              //   color: yellowColor,
                              // ),
                            ),
                            // onPressed: () => addAddressSuccess(context),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Image.asset(
                                    'assets/images/master.png',
                                    fit: BoxFit.fill,
                                    height: 18,
                                    width: 30,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      child: Text.rich(
                                    TextSpan(
                                      text: "4383",
                                      style: TextStyle(
                                          color: Color(0xFF323232),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Kanit'),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                                // Spacer(),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 5),
                                  child: Image.asset(
                                    'assets/images/nx.png',
                                    fit: BoxFit.fill,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 1,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xFFCEFFCD),
                              textStyle: TextStyle(fontSize: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              side: BorderSide(
                                width: 1.0,
                                color: Color(0xFF83D79B),
                              ),
                            ),
                            // onPressed: () => addAddressSuccess(context),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Image.asset(
                                    'assets/images/tag.png',
                                    fit: BoxFit.fill,
                                    height: 14,
                                    width: 22,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      child: Text.rich(
                                    TextSpan(
                                      text: "ride50Freeiks...",
                                      style: TextStyle(
                                          color: Color(0xFF22A876),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Kanit'),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                                // Spacer(),
                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  child: Image.asset(
                                    'assets/images/nx1.png',
                                    fit: BoxFit.fill,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFF191919),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => callWeLink(OrderDetail: 'OrderDetail')),
                      );
                    },
                    child: Text(
                      'Confirm Order',
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

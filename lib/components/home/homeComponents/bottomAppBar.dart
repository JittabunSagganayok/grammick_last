import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkToGo.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/models/address/my_address_response.dart';

class bottomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 60,
      // constraints: maxHeightContain,
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width * 1,
            height: 20,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: new Container(
                height: 55,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: new BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeLinkToGoScreen()),
                    );
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 6, right: 6),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6, left: 50),
                          child: Image.asset(
                            'assets/images/car3.png',
                            fit: BoxFit.contain,
                            height: 23,
                            width: 40,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              right: 20,
                            ),
                            child: Text.rich(
                              TextSpan(
                                  text: "Where would you like ",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit'),
                                  children: [
                                    TextSpan(
                                      text: "to go?",
                                      style: TextStyle(
                                          color: yellowColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kanit'),
                                    )
                                  ]),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

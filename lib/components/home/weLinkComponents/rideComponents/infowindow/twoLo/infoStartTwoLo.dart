import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';

class infoStartTwoLo extends StatelessWidget {
  const infoStartTwoLo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(10),
            child: Container(
              height: 50,
              child: Stack(
                children: [
                  Container(
                    height: 33,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        children: [
                          Text(
                            "The Mall Banglapi",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A0A0A),
                                fontFamily: 'Kanit'),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Image.asset(
                              'assets/images/next2.png',
                              fit: BoxFit.fill,
                              color: Color(0xFFD2D2D2),
                              height: 14,
                              width: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 50,
                    child: Container(
                      child: Image.asset(
                        'assets/images/info.png',
                        fit: BoxFit.fill,
                        height: 13,
                        width: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 10,
              child: CircleAvatar(
                backgroundColor: Color(0xFF212B32),
                radius: 10,
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: yellDarkColor,
                        fontFamily: 'Kanit'),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class infoOneLo extends StatelessWidget {
  const infoOneLo({Key? key, this.startOneLo}) : super(key: key);
  final String? startOneLo;

  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
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
                              startOneLo == 'startOneLo' ? Container() :
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
                        child:  Container(
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
                startOneLo == 'startOneLo' ? Container() :
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 13),
                    child: Image.asset(
                      'assets/images/addlo.png',
                      fit: BoxFit.fill,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
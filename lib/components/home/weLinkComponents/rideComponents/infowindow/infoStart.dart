import 'package:flutter/material.dart';

class infoStart extends StatelessWidget {
  const infoStart({Key? key, this.startLoca, this.driver_ToGo}) : super(key: key);
  final String? startLoca;
  final String? driver_ToGo;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      driver_ToGo == 'driverToGo' ? '7/11 Premium Place' :
                      "Home , Keas 69 Str.15234",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A0A0A),
                          fontFamily: 'Kanit'),
                    ),
                    startLoca == 'startLoca' || driver_ToGo == 'driverToGo' ? Container() :
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:we_link/constant/stylesConstants.dart';

class howLongCar extends StatefulWidget {
  howLongCar({Key? key}) : super(key: key);

  @override
  State<howLongCar> createState() => _howLongCarState();
}

class _howLongCarState extends State<howLongCar> {
  var indexSelects = 0;
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

  void clickSelects(i) {
    setState(() {
      indexSelects = i;
    });

    print(indexSelects);
    print(i);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (var i = 0; i != car.length; i++)
            Container(
              constraints: maxHeightContain,
              child: Stack(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => clickSelects(i),
                        child: Container(
                            margin:
                                EdgeInsets.only(top: 14, left: 20, right: 20),
                            height: 65,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                                color: indexSelects == i
                                    ? Color(0xFFFFF7E7)
                                    : Color(0xFFEEEEF2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(
                                  color: indexSelects == i
                                      ? Color(0xFFFDB824)
                                      : Color(0xFFEEEEF2),
                                  width: 1,
                                )),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 13, right: 12),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: indexSelects == i
                                        ? Color(0xFFF9EBD0)
                                        : Color(0xFFFCFCFC),
                                    child: Image.asset(
                                      '${car[i]['image']}',
                                      fit: BoxFit.fitWidth,
                                      height: 20,
                                      width: 40,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                child: Text.rich(
                                              TextSpan(
                                                text: "${car[i]['title']}",
                                                style: TextStyle(
                                                    color: indexSelects == i
                                                        ? Color(0xFFAF7C0F)
                                                        : Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Kanit'),
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 9, right: 17),
                                              child: Text.rich(
                                                TextSpan(
                                                  text: "${car[i]['type']}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Kanit'),
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                child: Text.rich(
                                              TextSpan(
                                                text: "${car[i]['time']}",
                                                style: TextStyle(
                                                    color: indexSelects == i
                                                        ? Color(0xFFE5C78D)
                                                        : Color(0xFFB1B1B1),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Kanit'),
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 9, right: 17),
                                              child: Text.rich(
                                                TextSpan(
                                                  text: "${car[i]['subtitle']}",
                                                  style: TextStyle(
                                                      color: Color(0xFF40C255),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily: 'Kanit'),
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 12,
                    right: 16,
                    child: indexSelects == i
                        ? Container(
                            child: Image.asset(
                              'assets/images/check1.png',
                              fit: BoxFit.fill,
                              height: 20,
                              width: 20,
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

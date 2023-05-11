import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/callScreen.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/components/message/chat.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class scheduleDetail extends StatelessWidget {
  const scheduleDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var imageUrl = 'https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60';
    return Scaffold(
        // backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            shape: appbarBorder,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Detail',
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => callScreen()),
                            );
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF57B861),
                            child: Image.asset(
                              'assets/images/phone1.png',
                              fit: BoxFit.contain,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 19),
                        child: GestureDetector(
                          onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => viewImage(imageUrl: imageUrl)),
                                );
                              },
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                '${imageUrl}'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ChatListScreen(chatDiver: 'chatDiver')),
                            // );
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFFFDB824),
                            child: Image.asset(
                              'assets/images/chat2.png',
                              fit: BoxFit.contain,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Arrivin in 4 min',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      'Gray Vesta | 01E216RA',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(30, 21, 30, 0),
              child: Text(
                'DRIVER',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9D9E9B),
                    fontFamily: 'Kanit'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 21, 30, 21),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 19,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Lesster Lopez (35)',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/star1.png',
                            fit: BoxFit.contain,
                            height: 22,
                            width: 22,
                          ),
                        ),
                        Container(
                          child: Text(
                            ' 4.5',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 21, 30, 21),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Comment ',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting ',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF747474),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(height: 21),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Destination',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9D9E9B),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/loca1.png',
                                fit: BoxFit.contain,
                                height: 26,
                                width: 26,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2, bottom: 2),
                              child: SizedBox(
                                height: 10,
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  dashColor: Colors.black,
                                  dashLength: 3,
                                  dashGapLength: 3,
                                  lineThickness: 3,
                                  dashRadius: 5,
                                ),
                              ),
                            ),
                            Container(
                              child: Image.asset(
                                'assets/images/lo5.png',
                                fit: BoxFit.contain,
                                height: 26,
                                width: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 25, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '300/4, Premuim Place',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: 'Kanit'),
                            ),
                            SizedBox(height: 3),
                            Divider(
                              color: Color(0xFFE6E6E6),
                              thickness: 1,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'The Mall Bangkapi',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Summary',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9D9E9B),
                          fontFamily: 'Kanit'),
                    ),
                  ),
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
                                side: BorderSide(
                                  width: 0.0,
                                  color: Color(0xFFF4F4F4),
                                ),
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
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
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
                          side: BorderSide(
                            width: 0.0,
                            color: Color(0xFFF4F4F4),
                          ),
                        ),
                        // onPressed: () => addAddressSuccess(context),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text.rich(
                                TextSpan(
                                  text: "Total",
                                  style: TextStyle(
                                      color: yellowColor,
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
                                child: Text.rich(
                                  TextSpan(
                                    text: "200 ฿",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Kanit'),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/notification/notification_detail_response.dart';

class NotificationDetailScreen extends StatelessWidget {
  NotificationDetail? notificationDetail;

  NotificationDetailScreen(this.notificationDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
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
            notificationDetail?.type ?? "",
            style: titleWhiteAppbar,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 30),
            child: Image.asset(
              'assets/images/Offer.png',
              fit: BoxFit.fill,
              height: 213,
              width: MediaQuery.of(context).size.width * 1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 26),
            child: Text(
              notificationDetail?.type ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Kanit',
                  fontSize: 19),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 26,top: 8),
            child: Builder(builder: (context) {
              var date = DateFormat('dd/MM/yyyy')
                  .format(DateTime.parse(notificationDetail?.createdAt ?? ""));
              return Text(
                date,
                style: TextStyle(
                  color: Color(0xFF5F5F5F),
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Kanit',
                  fontSize: 12,
                ),
              );
            }),
          ),
          Container(
            margin: EdgeInsets.only(left: 26, right: 26, top: 11),
            child: Text(
              notificationDetail?.title ?? "",
              style: TextStyle(
                color: Color(0xFF4D4D4D),
                fontWeight: FontWeight.w300,
                fontFamily: 'Kanit',
                fontSize: 16,
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (notificationDetail?.type == 'ACTIVITY') {
                return SizedBox(height:0 ,);
              }
              return Container(
                margin: EdgeInsets.only(left: 26, top: 24),
                child: Text(
                  'Conditions',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Kanit',
                      fontSize: 14),
                ),
              );
            }
          ),
          Container(
            margin: EdgeInsets.only(left: 26, right: 26, top: 11),
            child: Text(
              notificationDetail?.description ?? "",
              style: TextStyle(
                color: Color(0xFF4D4D4D),
                fontWeight: FontWeight.w300,
                fontFamily: 'Kanit',
                fontSize: 14,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

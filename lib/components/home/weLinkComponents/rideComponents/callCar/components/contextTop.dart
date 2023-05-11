import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/carPending.dart';

import '../../../../../../models/activity/we-ride/we_ride_activity_response.dart';

class ActivityStatusWidget extends StatelessWidget {
  WeRideActivityResponse? activityResponse;
  ActivityStatus status;

  ActivityStatusWidget(
    this.status, {
    this.activityResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(right: 20, left: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: getColorStatus(),
          textStyle: TextStyle(fontSize: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(
            width: 0.0,
            color: getColorStatus(),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              if (status == ActivityStatus.START_POINT_TWO) {
                return Container(
                  height: 0,
                );
              } else if (status == ActivityStatus.ARRIVED) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.asset(
                    'assets/images/icon.png',
                    height: 32,
                  ),
                );
              } else {
                return Container(
                  height: 0,
                );
              }
            }),
            Text.rich(
              TextSpan(
                  text: getMessageStatus(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Kanit')),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Color getColorStatus() {
    // if (status == ActivityStatus.ARRIVED) {
    //   return Color(0xFF40C255);
    // } else if (status == ActivityStatus.PICKUP) {
    //   return Color(0xFF40C255);
    // } else {
      return Color(0xFF40C255);
    // }
  }

  String getMessageStatus() {
    if (status == ActivityStatus.ARRIVED) {
      return 'Congratulations on meeting the driver';
    } else if (status == ActivityStatus.PICKUP) {
      return 'The ride began';
    } else if (status == ActivityStatus.SEND_OF_PASSENGER) {
      return 'Success';
    } else if (status == ActivityStatus.START_POINT_TWO) {
      return 'Destination 1 Success';
    } else if (status == ActivityStatus.SEND_OF_PASSENGER_POINT_TWO) {
      return 'Destination 2 Success';
    } else {
      return '';
    }
  }
}

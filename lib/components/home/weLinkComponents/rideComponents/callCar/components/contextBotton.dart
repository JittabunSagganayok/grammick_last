import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/carPending.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/information.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/report_order/report_problem_screen.dart';
import 'package:we_link/models/activity/we-ride/we_ride_activity_response.dart';
import 'package:we_link/shared/rating/app_rating.dart';

import '../../../../../message/chat.dart';

class ActivityDriverDetailWidget extends StatelessWidget {
  WeRideActivityResponse? activityResponse;
  ActivityStatus? activityStatus;

  ActivityDriverDetailWidget({
    this.activityResponse,
    this.activityStatus = ActivityStatus.PROCESS,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 57),
                child: ClipPath(
                    clipper: CustomClipperImage(),
                    child: Container(
                      // height: MediaQuery.of(context).size.width * 0.3,
                      constraints: maxHeightContain,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: bottomDecoration,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 17,
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              await launchUrl(Uri.parse(
                                                  'tel:${activityResponse?.result?.driver?.phone ?? ""}'));
                                            },
                                            child: CircleAvatar(
                                              radius: 27,
                                              backgroundColor:
                                                  Color(0xFF57B861),
                                              child: Image.asset(
                                                'assets/images/phone1.png',
                                                fit: BoxFit.contain,
                                                height: 22,
                                                width: 22,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(ChatListScreen(
                                                activityId: activityResponse
                                                        ?.result?.id ??
                                                    -1,
                                              ));
                                            },
                                            child: CircleAvatar(
                                              radius: 27,
                                              backgroundColor:
                                                  Color(0xFFFDB824),
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
                                  ),
                                  Positioned(
                                      top: 5,
                                      right: 30,
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundImage: NetworkImage(
                                            activityResponse
                                                    ?.result?.driver?.picture ??
                                                ""),
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
                              decoration: typeButton,
                              child: Text(
                                activityResponse?.result?.type ?? "",
                                style: typeTText,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Builder(builder: (context) {
                                Distance? distance;

                                if (activityResponse
                                        ?.result?.driveYourCarResponse !=
                                    null) {
                                  distance = activityResponse
                                      ?.result?.driveYourCarResponse?.distance;
                                } else if (activityResponse
                                    ?.result?.weRentResponse !=
                                    null) {
                                  distance = activityResponse
                                      ?.result?.weRentResponse?.distance;
                                } else if (activityResponse
                                    ?.result?.assistant !=
                                    null) {
                                  distance = activityResponse
                                      ?.result?.assistant?.distance;
                                } else {
                                  distance =
                                      activityResponse?.result?.ride?.distance;
                                }

                                var time = distance?.time;

                                var isHour = (time?.hours ?? 0) > 0;

                                var arriveTime = '';
                                if (isHour) {
                                  arriveTime =
                                      '${time?.hours ?? 0} hour ${time?.minute ?? 0} min';
                                } else {
                                  arriveTime = '${time?.minute ?? 0} min';
                                }

                                return Text(
                                  'Arrivin in $arriveTime',
                                  style: bottomTitleText,
                                );
                              }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Builder(builder: (context) {
                                    if (activityResponse?.result?.driveYourCarResponse != null) {
                                      return Text('Your driver',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      );
                                    } else if (activityResponse?.result?.weRentResponse != null) {
                                      return Text(
                                        '${activityResponse?.result?.ride?.vehicleType?.name ?? ""} | ${activityResponse?.result?.driver?.vehicle?.plateNo ?? ""} ',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      );
                                    } else {
                                      return Text(
                                        '${activityResponse?.result?.ride?.vehicleType?.name ?? ""} | ${activityResponse?.result?.driver?.vehicle?.plateNo ?? ""} ',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      );
                                    }
                                  }),
                                ),
                                Container(
                                  child: SvgPicture.asset('assets/ic_rating_full.svg',width: 20,height: 20,),
                                ),
                                Container(
                                  child: Builder(builder: (context) {
                                    var rating = (activityResponse?.result
                                                ?.driver?.ratings?.avg ??
                                            0)
                                        .round();
                                    return Text(
                                      ' ${rating.toStringAsFixed(1)}',
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Kanit'),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: GestureDetector(
                                onTap: () => activityInformation(
                                    context, activityResponse!),
                                child: Container(
                                  margin: EdgeInsets.only(top: 2),
                                  child: Text(
                                    'More information',
                                    style: bottomInForText,
                                  ),
                                ),
                              ),
                            ),
                            Builder(builder: (context) {
                              if (activityStatus == ActivityStatus.PROCESS) {
                                return SizedBox(
                                  height: 0,
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: OutlinedButton(
                                    onPressed: () {
                                      Get.to(ReportProblemScreen(
                                          cancelOrder: false));
                                    },
                                    style: OutlinedButton.styleFrom(
                                      primary: Color(0xffFFEFCE),
                                      backgroundColor: Color(0xffFFEFCE),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side: BorderSide(
                                              color: Color(0xffFDB824))),
                                    ),
                                    child: Text(
                                      'Emergency',
                                      style: GoogleFonts.kanit(
                                        color: Colors.black45,
                                        fontSize: 13,
                                      ),
                                    )),
                              );
                            })
                          ],
                        ),
                      ),
                    )),
              ),
              if (activityResponse?.result?.driveYourCarResponse == null) ...[
                Positioned(
                  right: 0,
                  left: 120,
                  top: 35,
                  child: Builder(
                      builder: (context) {
                        var activity = activityResponse?.result;
                        String picture;

                        if (activity?.weRentResponse != null) {
                          picture = activity?.weRentResponse?.vehiclePacket?.picture ?? "";
                        }else  if (activity?.driveYourCarResponse != null) {
                          picture = "";
                        }else  if (activity?.assistant != null) {
                          picture = activity?.weRentResponse?.vehiclePacket?.picture ?? "";
                        }else {
                          picture = activityResponse?.result?.driver
                              ?.vehicle?.vehiclePicture ??
                              "";
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => viewImage(
                                      imageUrl: picture)),
                            );
                          },
                          child: Container(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(picture),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ],
              Positioned(
                right: 2,
                left: 0,
                top: 0,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => viewImage(
                                imageUrl:
                                activityResponse?.result?.driver?.picture ??
                                    "")),
                      );
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 53,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            activityResponse?.result?.driver?.picture ?? ""),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(2 * size.width / 2.9, 0.0);
    // var firstEnd = Offset(size.width / 1, size.height / 2);
    path.arcToPoint(Offset(size.width / 3.25, 0), radius: Radius.circular(1));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/components/message/chat.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/report_order/report_problem_screen.dart';

import '../../../../../../models/activity/we-ride/we_ride_activity_response.dart';
import '../review.dart';

void activityInformation(
    BuildContext context, WeRideActivityResponse activityResponse) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 120),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 57),
                child: ClipPath(
                    clipper: CustomClipperImage(),
                    child: Container(
                      constraints: maxHeightContain,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: bottomDecoration,
                      child: Column(
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
                                                'tel:${activityResponse.result?.driver?.phone ?? ""}'));
                                          },
                                          child: CircleAvatar(
                                            radius: 27,
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
                                ),
                                Positioned(
                                    top: 5,
                                    right: 25,
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: Color(0xFFEF3738),
                                    ))
                              ],
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
                                    .result?.driveYourCarResponse?.distance;
                              } else if (activityResponse
                                      ?.result?.weRentResponse !=
                                  null) {
                                distance = activityResponse
                                    .result?.weRentResponse?.distance;
                              } else if (activityResponse?.result?.assistant !=
                                  null) {
                                distance = activityResponse
                                    .result?.assistant?.distance;
                              } else {
                                distance =
                                    activityResponse.result?.ride?.distance;
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
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${activityResponse.result?.ride?.vehicleType?.name ?? ""} | ${activityResponse.result?.driver?.vehicle?.plateNo ?? ""} ',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Container(
                                                    child: Text("Order :",
                                                        style:
                                                            fieldSearchHintText)),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 9),
                                                  padding: EdgeInsets.fromLTRB(
                                                      9, 6, 9, 6),
                                                  decoration: typeButton,
                                                  child: Text(
                                                    activityResponse
                                                            ?.result?.type ??
                                                        "",
                                                    style: typeTText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                              '${activityResponse.result?.orderId ?? ""}',
                                              style: fieldSearchHintText),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 1,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 15),
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
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: CircleAvatar(
                                            radius: 19,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(
                                                activityResponse.result?.driver
                                                        ?.picture ??
                                                    ""),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${activityResponse.result?.driver?.name} '
                                            '${activityResponse.result?.driver?.lastname} '
                                            '(อายุ ${activityResponse.result?.driver?.age ?? '"n/a"'} ปี)',
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                fontFamily: 'Kanit'),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  'assets/ic_rating_full.svg',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                              Container(
                                                child:
                                                    Builder(builder: (context) {
                                                  var rating = (activityResponse
                                                              .result
                                                              ?.driver
                                                              ?.ratings
                                                              ?.avg ??
                                                          0)
                                                      .round();
                                                  return Text(
                                                    ' ${rating.toStringAsFixed(1)}',
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontFamily: 'Kanit'),
                                                  );
                                                }),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 1,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 15),
                                      child: Text(
                                        'Destination',
                                        style: inforTitleText,
                                      ),
                                    ),
                                    ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      itemCount: activityResponse.result?.ride
                                              ?.destinations?.length ??
                                          0,
                                      primary: false,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item = activityResponse
                                            .result?.ride?.destinations?[index];
                                        return ItemDestination(item);
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              Divider(
                                        height: 16,
                                        indent: 40,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 18),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Total Distance',
                                              style: inforTitleText,
                                            ),
                                          ),
                                          Builder(builder: (context) {
                                            num km = 0;

                                            if (activityResponse
                                                    ?.result?.weRentResponse !=
                                                null) {
                                              km = activityResponse
                                                      ?.result
                                                      ?.weRentResponse
                                                      ?.distance
                                                      ?.km ??
                                                  0;
                                            } else if (activityResponse?.result
                                                    ?.driveYourCarResponse !=
                                                null) {
                                              km = activityResponse
                                                      ?.result
                                                      ?.driveYourCarResponse
                                                      ?.distance
                                                      ?.km ??
                                                  0;
                                            } else if (activityResponse
                                                    ?.result?.assistant !=
                                                null) {
                                              km = activityResponse
                                                      ?.result
                                                      ?.assistant
                                                      ?.distance
                                                      ?.km ??
                                                  0;
                                            } else if (activityResponse
                                                    ?.result?.ride !=
                                                null) {
                                              km = activityResponse?.result
                                                      ?.ride?.distance?.km ??
                                                  0;
                                            }
                                            return Text(
                                              '$km km',
                                              style: distanceText,
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16),
                                      child: Builder(builder: (context) {
                                        var activity = activityResponse?.result;
                                        if (activity?.weRentResponse != null) {
                                          return Column(
                                            children: [
                                              Divider(
                                                color: Color(0xFFE6E6E6),
                                                thickness: 1,
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Your Package :',
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff564FF0)),
                                                  ),
                                                  Builder(builder: (context) {
                                                    var rent = activity
                                                        ?.weRentResponse;
                                                    var title = "";
                                                    if (rent?.usePacket ==
                                                        true) {
                                                      title = activity
                                                              ?.weRentResponse
                                                              ?.vehiclePacket
                                                              ?.title ??
                                                          "";
                                                    } else {
                                                      title = rent?.vehicleType
                                                              ?.name ??
                                                          "";
                                                    }

                                                    var fuel = false;
                                                    if (rent?.usePacket ==
                                                        true) {
                                                      fuel = rent?.vehiclePacket
                                                              ?.fuel ==
                                                          true;
                                                    } else {
                                                      fuel = rent?.fuel == true;
                                                    }

                                                    var message = fuel == true
                                                        ? '(including fuel)'
                                                        : '(non including fuel)';
                                                    return Text(
                                                      '${title} $message',
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    );
                                                  }),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total :',
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff564FF0)),
                                                  ),
                                                  Builder(builder: (context) {
                                                    var house = 0;
                                                    if (activity?.weRentResponse
                                                            ?.usePacket ==
                                                        true) {
                                                      house = activity
                                                              ?.weRentResponse
                                                              ?.vehiclePacket
                                                              ?.house
                                                              ?.toInt() ??
                                                          0;
                                                    } else {
                                                      house = activity
                                                              ?.weRentResponse
                                                              ?.house
                                                              ?.toInt() ??
                                                          0;
                                                    }
                                                    return Text(
                                                      '$house days',
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    );
                                                  }),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                            ],
                                          );
                                        } else if (activity
                                                ?.driveYourCarResponse !=
                                            null) {
                                          return Column(
                                            children: [
                                              Divider(
                                                color: Color(0xFFE6E6E6),
                                                thickness: 1,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Your car :',
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff564FF0)),
                                                  ),
                                                  Builder(builder: (context) {
                                                    return Text(
                                                      activity?.driveYourCarResponse
                                                              ?.car
                                                              ?.toUpperCase() ??
                                                          "",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    );
                                                  }),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Drive system :',
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff564FF0)),
                                                  ),
                                                  Text(
                                                    activity?.driveYourCarResponse
                                                            ?.driveSystem ??
                                                        "",
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                            ],
                                          );
                                        } else {
                                          return SizedBox(
                                            height: 0,
                                          );
                                        }
                                      }),
                                    ),
                                    Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 1,
                                    ),
                                    Builder(builder: (context) {
                                      var activity = activityResponse?.result;
                                      if (activity?.type != "ASSISTANT") {
                                        return SizedBox(
                                          height: 0,
                                        );
                                      }
                                      if (activity?.type == "ASSISTANT" &&
                                          activity?.assistant?.type == "FIX") {
                                        var assistant = activity?.assistant;
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Text(
                                              'Detail order'.toUpperCase(),
                                              style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff636363)),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/ic_we_fix.svg'),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  assistant?.serviceCategory
                                                          ?.name
                                                          .toString() ??
                                                      "",
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 12),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 8),
                                              child: Text(
                                                assistant?.note ?? "",
                                                style: GoogleFonts.kanit(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF3F3F3),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              width: Get.width,
                                            ),
                                            Container(
                                              height: 56,
                                              child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder:
                                                    (BuildContext context,
                                                            int index) =>
                                                        Divider(
                                                  indent: 8,
                                                  endIndent: 8,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final imageUrl = assistant
                                                      ?.pictures?[index];
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    child:
                                                        ExtendedImage.network(
                                                      imageUrl ?? "",
                                                      width: 64,
                                                      height: 64,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Color(
                                                              0xffF9AC12)),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                                itemCount: assistant
                                                        ?.pictures?.length ??
                                                    0,
                                                shrinkWrap: true,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 16),
                                              ),
                                            ),
                                            Text(
                                              "Offer",
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                color: Color(0xff9D9E9B),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "The price you set",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    color: Color(0xffFF855E),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  "${assistant?.additionalCost ?? ""} THB",
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 14,
                                                    color: Color(0xff303030),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      } else {
                                        return Container(
                                            margin: EdgeInsets.only(
                                              top: 24,
                                            ),
                                            child: AssistantOrderListWidget(
                                                activity!));
                                      }
                                    }),
                                    Builder(builder: (context) {
                                      var activity = activityResponse?.result;
                                      if (activity?.weRentResponse == null) {
                                        return SizedBox(
                                          height: 0,
                                        );
                                      }
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(
                                                bottom: 15, top: 15),
                                            child: Text(
                                              'Which place you plan to go to ?',
                                              style: inforTitleText,
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            child: TextFormField(
                                              autofocus: false,
                                              readOnly: true,
                                              controller:
                                                  TextEditingController()
                                                    ..text = activity
                                                            ?.weRentResponse
                                                            ?.plan ??
                                                        "",
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                // hintText: 'Write request',
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintStyle: hintTextStyle,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 14.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15.0)),
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFEDEDED),
                                                        )),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15.0)),
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFEDEDED),
                                                        )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    Builder(builder: (context) {
                                      return Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(
                                            bottom: 15, top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Summary',
                                              style: inforTitleText,
                                            ),
                                            Text(
                                              "Total",
                                              style: inforTitleText,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 7, 10, 7),
                                                decoration: paymentButton,
                                                child: Text.rich(
                                                  TextSpan(
                                                    text: activityResponse
                                                            ?.result
                                                            ?.paymentMethod ??
                                                        "",
                                                    style: paymentButtonText,
                                                  ),
                                                ),
                                              ),
                                              Builder(builder: (context) {
                                                if (activityResponse
                                                        ?.result?.couponId ==
                                                    null) {
                                                  return SizedBox(
                                                    height: 0,
                                                  );
                                                }
                                                return Container(
                                                  decoration:
                                                      pomotionSelectedDecoration
                                                          ?.copyWith(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                    Radius.circular(7),
                                                  )),
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 7, 10, 7),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 5),
                                                        child: Image.asset(
                                                          'assets/images/wallet1.png',
                                                          fit: BoxFit.fill,
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                            child: Text.rich(
                                                          TextSpan(
                                                            text:
                                                                activityResponse
                                                                        .result
                                                                        ?.coupon
                                                                        ?.name ??
                                                                    "",
                                                            style:
                                                                codePromoText,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                              Expanded(
                                                  child: SizedBox(
                                                width: 8,
                                              ))
                                            ],
                                          )),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Container(
                                            width: 100,
                                            alignment: Alignment.centerRight,
                                            child: Builder(builder: (context) {
                                              var activity =
                                                  activityResponse.result;
                                              var totalCost = '';
                                              if (activity
                                                      ?.driveYourCarResponse !=
                                                  null) {
                                                totalCost = activityResponse
                                                        .result
                                                        ?.driveYourCarResponse
                                                        ?.cost ??
                                                    "n/a";
                                              } else if (activity
                                                      ?.weRentResponse !=
                                                  null) {
                                                var package = activity
                                                    ?.weRentResponse
                                                    ?.vehiclePacket;

                                                if (activity?.weRentResponse
                                                        ?.usePacket ==
                                                    true) {
                                                  totalCost =
                                                      package?.price ?? "0";
                                                } else {
                                                  num house = (activity
                                                          ?.weRentResponse
                                                          ?.house
                                                          ?.toInt() ??
                                                      0);
                                                  num? newCost = num.tryParse(
                                                      (activity
                                                              ?.weRentResponse
                                                              ?.vehicleType
                                                              ?.cost ??
                                                          "0"));
                                                  var total =
                                                      (newCost ?? 0) * house;
                                                  totalCost =
                                                      total.toStringAsFixed(2);
                                                }
                                              } else if (activity?.assistant !=
                                                  null) {
                                                totalCost = activityResponse
                                                        .result
                                                        ?.assistant
                                                        ?.cost ??
                                                    "n/a";
                                              } else {
                                                totalCost = activityResponse
                                                        .result?.ride?.cost ??
                                                    "n/a";
                                              }
                                              return Text(
                                                '$totalCost ฿',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: 'Kanit'),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          OutlinedButton(
                              onPressed: () {
                                Get.to(ReportProblemScreen(
                                  cancelOrder: true,
                                ));
                              },
                              style: OutlinedButton.styleFrom(
                                primary: Color(0xffFFBCBC),
                                backgroundColor: Color(0xffFFBCBC),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Color(0xffED7777))),
                              ),
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.kanit(
                                  color: Color(0xff860D0D),
                                  fontSize: 13,
                                ),
                              )),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    )),
              ),
              Positioned(
                right: 2,
                left: 0,
                top: 0,
                child: Builder(builder: (context) {
                  var activity = activityResponse.result;
                  String picture;

                  if (activity?.weRentResponse != null) {
                    picture = activity?.driver?.picture ?? "";
                  } else if (activity?.driveYourCarResponse != null) {
                    picture = activity?.driver?.picture ?? "";
                  } else if (activity?.assistant != null) {
                    picture = activity?.driver?.picture ?? "";
                  } else {
                    picture = activity?.ride?.vehicleType?.picture ?? "";
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => viewImage(imageUrl: picture)),
                      );
                    },
                    child: Container(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 56,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(picture),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ));
    },
  );
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

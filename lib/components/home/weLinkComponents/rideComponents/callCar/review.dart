import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/activity/we-ride/we_ride_activity_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/main_screen.dart';

class ActivityReviewScreen extends StatefulWidget {
  WeRideActivityResponse? activityResponse;
  bool? enableEditing = true;

  ActivityReviewScreen({
    Key? key,
    this.activityResponse,
    this.enableEditing = true,
  }) : super(key: key);

  @override
  State<ActivityReviewScreen> createState() => _ActivityReviewScreenState();
}

class _ActivityReviewScreenState
    extends AppState<ActivityReviewScreen, ActivityReviewViewModel> {
  bool hide = false;

  TextEditingController controller = TextEditingController();

  @override
  ActivityReviewViewModel initViewModel(ActivityReviewViewModel viewModel) {
    viewModel.setArgument(
      widget.activityResponse,
      widget.enableEditing,
    );

    viewModel.comment.listen((text) {
      if (text.isNotEmpty == true) {
        controller.text = text;
      }
    });

    viewModel.getOrderDetail();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ActivityReviewViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.value == true) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
            backgroundColor: appBackgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: AppBar(
                backgroundColor: blackColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                shape: appbarBorder,
                centerTitle: true,
                title: Text(
                  'Review',
                  style: titleYellowAppbar,
                ),
                leading: widget?.enableEditing == true
                    ? SizedBox(
                        width: 0,
                      )
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset('assets/images/goBack.png'),
                      ),
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        child: Container(
                      // margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Column(
                        children: [
                          Container(
                            constraints: maxHeightContain,
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                                child: Text("Order : ",
                                                    style:
                                                        fieldSearchHintText)),
                                            Container(
                                              margin: EdgeInsets.only(left: 9),
                                              padding: EdgeInsets.fromLTRB(
                                                  9, 6, 9, 6),
                                              decoration: typeButton,
                                              child: Text(
                                                viewModel.activityResponse
                                                        ?.result?.type ??
                                                    "",
                                                style: typeTText,
                                              ),
                                            ),
                                            Builder(builder: (context) {
                                              if (viewModel.activityResponse
                                                      ?.result?.status !=
                                                  'CANCEL') {
                                                return SizedBox(
                                                  height: 0,
                                                  width: 0,
                                                );
                                              }
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  'Cancelled',
                                                  style: GoogleFonts.kanit(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(
                                                        0xffF8772F,
                                                      )),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ),
                                      Text(
                                          viewModel.activityResponse?.result
                                                  ?.orderId ??
                                              '',
                                          style: fieldSearchHintText),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 35, bottom: 7),
                                  child: Text(
                                    'The ride is over',
                                    style: TitleActivity,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Rate your trip, it is important for us',
                                    style: subTitleActivity,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, top: 18, bottom: 19),
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(viewModel
                                            .activityResponse
                                            ?.result
                                            ?.driver
                                            ?.picture ??
                                        ""),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    '${viewModel.activityResponse?.result?.driver?.name} '
                                    '${viewModel.activityResponse?.result?.driver?.lastname} '
                                    '(อายุ ${viewModel.activityResponse?.result?.driver?.age ?? '"n/a"'} ปี)',
                                    style: bottomSubTitleText,
                                  ),
                                ),
                                Builder(builder: (context) {
                                  if (viewModel.activityResponse?.result
                                              ?.weRentResponse !=
                                          null ||
                                      viewModel.activityResponse?.result
                                              ?.driveYourCarResponse !=
                                          null) {
                                    return SizedBox(
                                      height: 8,
                                    );
                                  }
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      '${viewModel.activityResponse?.result?.ride?.vehicleType?.name ?? ""} | ${viewModel.activityResponse?.result?.ride?.vehicleType?.name ?? ''}',
                                      style: subtitleActivity,
                                    ),
                                  );
                                }),
                                Builder(builder: (context) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() => RatingBar(
                                            initialRating:
                                                viewModel.rating.value,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            ignoreGestures:
                                                viewModel.enableEditing ==
                                                    false,
                                            itemCount: 5,
                                            minRating: 0,
                                            maxRating: 5,
                                            itemSize: 40,
                                            ratingWidget: RatingWidget(
                                              full: Image.asset(
                                                  'assets/images/star1.png'),
                                              half: Image.asset(
                                                  'assets/images/Star.png'),
                                              empty: Image.asset(
                                                  'assets/images/Star.png'),
                                            ),
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1),
                                            onRatingUpdate: (rating) {
                                              viewModel.rating.value = rating;
                                            },
                                          )),
                                      Obx(() => Text(
                                            ' ' + '${viewModel.rating.value}',
                                            style: sumStar,
                                          )),
                                    ],
                                  );
                                }),
                                Container(
                                  margin: EdgeInsets.only(top: 25),
                                  child: TextFormField(
                                    controller: controller,
                                    readOnly: viewModel.enableEditing == false,
                                    keyboardType: TextInputType.text,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintText: 'Write you comment',
                                      fillColor: Color(0xFFFBFBFB),
                                      filled: true,
                                      hintStyle: hintTextStyle,
                                      enabledBorder: reviewBorderStyle,
                                      focusedBorder: reviewBorderStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: maxHeightContain,
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Detail',
                                          style: titleHide,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            hide = !hide;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 8),
                                          padding:
                                              EdgeInsets.fromLTRB(14, 6, 14, 6),
                                          decoration: BoxDecoration(
                                              color: hide
                                                  ? Colors.black
                                                  : Color(0xFF189B58),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              )),
                                          child: Text.rich(
                                            TextSpan(
                                              text: hide ? 'See more' : "Hide",
                                              style: hideText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                                !hide
                                    ? Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(
                                                bottom: 15, top: 15),
                                            child: Text(
                                              'Destination',
                                              style: inforTitleText,
                                            ),
                                          ),
                                          Builder(builder: (context) {
                                            return ListView.separated(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16),
                                              itemCount: viewModel
                                                      .activityResponse
                                                      ?.result
                                                      ?.ride
                                                      ?.destinations
                                                      ?.length ??
                                                  0,
                                              primary: false,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final item = viewModel
                                                    .activityResponse
                                                    ?.result
                                                    ?.ride
                                                    ?.destinations?[index];
                                                return ItemDestination(item);
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      Divider(
                                                height: 16,
                                                indent: 40,
                                              ),
                                            );
                                          }),
                                          Builder(builder: (context) {
                                            var activity = viewModel
                                                .activityResponse?.result;
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 15, top: 18),
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

                                                    if (activity?.type ==
                                                        'RENT') {
                                                      km = viewModel
                                                              .activityResponse
                                                              ?.result
                                                              ?.weRentResponse
                                                              ?.distance
                                                              ?.km ??
                                                          0;
                                                    } else if (activity?.type ==
                                                        'DRIVE_YOUR_CAR') {
                                                      km = viewModel
                                                              .activityResponse
                                                              ?.result
                                                              ?.driveYourCarResponse
                                                              ?.distance
                                                              ?.km ??
                                                          0;
                                                    } else if (activity?.type ==
                                                        'ASSISTANT') {
                                                      km = viewModel
                                                              .activityResponse
                                                              ?.result
                                                              ?.assistant
                                                              ?.distance
                                                              ?.km ??
                                                          0;
                                                    } else if (activity?.type ==
                                                        'RIDE') {
                                                      km = viewModel
                                                              .activityResponse
                                                              ?.result
                                                              ?.ride
                                                              ?.distance
                                                              ?.km ??
                                                          0;
                                                    } else {
                                                      km = 0;
                                                    }
                                                    return Text(
                                                      '$km km',
                                                      style: distanceText,
                                                    );
                                                  }),
                                                ],
                                              ),
                                            );
                                          }),
                                          Divider(
                                            color: Color(0xFFE6E6E6),
                                            thickness: 1,
                                          ),
                                          Builder(builder: (context) {
                                            var activity = viewModel
                                                .activityResponse?.result;
                                            if (activity?.type != 'ASSISTANT') {
                                              return SizedBox(
                                                height: 0,
                                              );
                                            }
                                            if (activity?.type == "ASSISTANT" &&
                                                activity?.assistant?.type ==
                                                    "FIX") {
                                              var assistant =
                                                  activity?.assistant;
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 24,
                                                  ),
                                                  Text(
                                                    'Detail order'
                                                        .toUpperCase(),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff636363)),
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
                                                        assistant
                                                                ?.serviceCategory
                                                                ?.name
                                                                .toString() ??
                                                            "",
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 12),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 8),
                                                    child: Text(
                                                      assistant?.note ?? "",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffF3F3F3),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
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
                                                        final imageUrl =
                                                            assistant
                                                                    ?.pictures?[
                                                                index];
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          child: ExtendedImage
                                                              .network(
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
                                                              ?.pictures
                                                              ?.length ??
                                                          0,
                                                      shrinkWrap: true,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16,
                                                              vertical: 16),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Offer",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 12,
                                                      color: Color(0xff9D9E9B),
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xffFF855E),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${assistant?.additionalCost ?? ""} THB",
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff303030),
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                  child:
                                                      AssistantOrderListWidget(
                                                          activity!));
                                            }
                                          }),
                                          Divider(
                                            color: Color(0xFFE6E6E6),
                                            thickness: 1,
                                          ),
                                          Builder(builder: (context) {
                                            var activity = viewModel
                                                .activityResponse?.result;
                                            if (activity?.weRentResponse ==
                                                null) {
                                              return SizedBox(
                                                height: 0,
                                              );
                                            }
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
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
                                                    keyboardType:
                                                        TextInputType.text,
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          15.0)),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFEDEDED),
                                                              )),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          15.0)),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFEDEDED),
                                                              )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                          Builder(builder: (context) {
                                            var activity = viewModel
                                                .activityResponse?.result;
                                            if (activity
                                                    ?.driveYourCarResponse ==
                                                null) {
                                              return SizedBox(
                                                height: 0,
                                              );
                                            }
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin: EdgeInsets.only(
                                                      bottom: 15, top: 15),
                                                  child: Text(
                                                    'Request',
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
                                                                  ?.driveYourCarResponse
                                                                  ?.more ??
                                                              "",
                                                    keyboardType:
                                                        TextInputType.text,
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          15.0)),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFEDEDED),
                                                              )),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          15.0)),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFEDEDED),
                                                              )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 15, top: 18),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Summary',
                                                    style: inforTitleText,
                                                  ),
                                                ),
                                                Text(
                                                  'Total',
                                                  style: inforTitleText,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(builder: (context) {
                                            var activity = viewModel
                                                .activityResponse?.result;
                                            if (activity?.type != 'ASSISTANT') {
                                              return Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      bottom: 10,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 8),
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          7,
                                                                          10,
                                                                          7),
                                                              decoration:
                                                                  paymentButton,
                                                              child: Text.rich(
                                                                TextSpan(
                                                                  text: viewModel
                                                                          ?.activityResponse
                                                                          ?.result
                                                                          ?.paymentMethod ??
                                                                      '',
                                                                  style:
                                                                      paymentButtonText,
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(builder:
                                                                (context) {
                                                              if (viewModel
                                                                      .activityResponse
                                                                      ?.result
                                                                      ?.couponId ==
                                                                  null) {
                                                                return SizedBox(
                                                                  height: 0,
                                                                );
                                                              }
                                                              return Expanded(
                                                                child:
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            9,
                                                                            10,
                                                                            9),
                                                                        decoration:
                                                                            typeButton,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.only(right: 5),
                                                                              child: Image.asset(
                                                                                'assets/images/tag.png',
                                                                                fit: BoxFit.fill,
                                                                                height: 10,
                                                                                width: 14,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                  child: Text(
                                                                                "ride50Freeiks...",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: sumButtonText,
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        )),
                                                              );
                                                            }),
                                                          ],
                                                        )),
                                                        SizedBox(
                                                          width: 25,
                                                        ),
                                                        Container(
                                                          width: 100,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Builder(
                                                              builder:
                                                                  (context) {
                                                            var activity = viewModel
                                                                .activityResponse
                                                                ?.result;
                                                            num cost = 0;
                                                            if (activity
                                                                    ?.driveYourCarResponse !=
                                                                null) {
                                                              cost = num.tryParse(viewModel
                                                                          .activityResponse
                                                                          ?.result
                                                                          ?.driveYourCarResponse
                                                                          ?.cost ??
                                                                      "0") ??
                                                                  0;
                                                            } else if (activity
                                                                    ?.assistant !=
                                                                null) {
                                                              cost = num.tryParse(viewModel
                                                                          .activityResponse
                                                                          ?.result
                                                                          ?.assistant
                                                                          ?.cost ??
                                                                      "0") ??
                                                                  0;
                                                            } else if (activity
                                                                    ?.weRentResponse !=
                                                                null) {
                                                              var package = activity
                                                                  ?.weRentResponse
                                                                  ?.vehiclePacket;
                                                              if (activity
                                                                      ?.weRentResponse
                                                                      ?.usePacket ==
                                                                  true) {
                                                                cost = num.tryParse(
                                                                        package?.price ??
                                                                            "0") ??
                                                                    0;
                                                              } else {
                                                                num house = (activity
                                                                        ?.weRentResponse
                                                                        ?.house
                                                                        ?.toInt() ??
                                                                    0);
                                                                num? cost = num.tryParse((activity
                                                                        ?.weRentResponse
                                                                        ?.vehicleType
                                                                        ?.cost ??
                                                                    "0"));
                                                                var total =
                                                                    (cost ??
                                                                            0) *
                                                                        house;
                                                                cost = total;
                                                              }
                                                            } else {
                                                              cost = num.tryParse(viewModel
                                                                          .activityResponse
                                                                          ?.result
                                                                          ?.ride
                                                                          ?.cost ??
                                                                      "0") ??
                                                                  0;
                                                            }

                                                            var additionalCost =
                                                                viewModel.getAdditionalCost(viewModel
                                                                        .activityResponse
                                                                        ?.result
                                                                        ?.type
                                                                        .toString() ??
                                                                    "");
                                                            var total = cost +
                                                                additionalCost;
                                                            return Text(
                                                              "$total ฿",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  priceTotalText,
                                                            );
                                                          }),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      '${viewModel.activityResponse?.result?.points ?? 0}pts',
                                                      style: poinText,
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
                                                ],
                                              );
                                            } else {
                                              return Container(
                                                  margin: EdgeInsets.only(
                                                    top: 16,
                                                  ),
                                                  child: AssistantSummaryWidget(
                                                      activity!));
                                            }
                                          }),
                                        ],
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  Builder(builder: (context) {
                    if (viewModel.enableEditing == false) {
                      return SizedBox(
                        height: 0,
                      );
                    }
                    return Container(
                      decoration: containerDecoration,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 30),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: yellowColor,
                              textStyle: TextStyle(fontSize: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              side: BorderSide(
                                width: 0.0,
                                color: yellowColor,
                              ),
                            ),
                            onPressed: () async {
                              await viewModel.sendReview(controller.text);
                              Get.offAll(MainScreen());
                            },
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Color(0xFF363636),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ));
      }
    });
  }
}

class ActivityReviewViewModel extends GetxController {
  Dio dio;

  WeRideActivityResponse? activityResponse;

  var rating = 0.0.obs;
  var loading = true.obs;
  var comment = ''.obs;

  bool? enableEditing = true;

  ActivityReviewViewModel(this.dio);

  void setArgument(
      WeRideActivityResponse? activityResponse, bool? enableEditing) {
    this.activityResponse = activityResponse;
    this.enableEditing = enableEditing;
  }

  Future getOrderDetail() async {
    loading.value = true;
    var response =
        await dio.get('activities/${activityResponse?.result?.id ?? 0}');
    activityResponse = WeRideActivityResponse.fromJson(response.data);

    if (activityResponse?.result?.activityReview != null) {
      rating.value =
          activityResponse?.result?.activityReview?.score?.toDouble() ?? 0;
      comment.value = activityResponse?.result?.activityReview?.comment ?? "";
    }

    if (activityResponse?.result?.weRentResponse != null) {
      var activity = activityResponse?.result?.ride;
      activity?.destinations = [];
      activity?.destinations?.insert(
          0,
          Destinations(
              destination: Destination(
            name: activityResponse?.result?.customerAddress?.name ?? "",
            address: activityResponse?.result?.customerAddress?.address ?? "",
            detail: activityResponse?.result?.customerAddress?.detail ?? "",
            icon: 'assets/icons/ic_activity_start.svg',
          )));
    } else if (activityResponse?.result?.driveYourCarResponse != null) {
      var activity = activityResponse?.result?.ride;
      activity?.destinations = [];
      activity?.destinations?.add(Destinations(
        destination:
            activityResponse?.result?.driveYourCarResponse?.destination,
      ));
      activity?.destinations?.forEach((element) {
        element.destination?.icon = 'assets/icons/ic_activity_destination.svg';
      });
      activity?.destinations?.insert(
          0,
          Destinations(
              destination: Destination(
            name: activityResponse?.result?.customerAddress?.name ?? "",
            address: activityResponse?.result?.customerAddress?.address ?? "",
            detail: activityResponse?.result?.customerAddress?.detail ?? "",
            icon: 'assets/icons/ic_activity_start.svg',
          )));
    } else if (activityResponse?.result?.assistant != null) {
      var activity = activityResponse?.result?.ride;
      activity?.destinations = [];
      activity?.destinations?.add(Destinations(
        destination: activityResponse?.result?.assistant?.destination,
      ));
      activity?.destinations?.forEach((element) {
        element.destination?.icon = 'assets/icons/ic_activity_destination.svg';
      });
      activity?.destinations?.insert(
          0,
          Destinations(
              destination: Destination(
            name: activityResponse?.result?.customerAddress?.name ?? "",
            address: activityResponse?.result?.customerAddress?.address ?? "",
            detail: activityResponse?.result?.customerAddress?.detail ?? "",
            icon: 'assets/icons/ic_activity_start.svg',
          )));
    } else if (activityResponse?.result?.ride != null) {
      var activity = activityResponse?.result?.ride;

      activity?.destinations?.forEach((element) {
        element.destination?.icon = 'assets/icons/ic_activity_destination.svg';
      });

      activity?.destinations?.insert(
          0,
          Destinations(
              destination: Destination(
            name: activityResponse?.result?.customerAddress?.name ?? "",
            address: activityResponse?.result?.customerAddress?.address ?? "",
            detail: activityResponse?.result?.customerAddress?.detail ?? "",
            icon: 'assets/icons/ic_activity_start.svg',
          )));
    }

    loading.value = false;
  }

  Future sendReview(
    String feedback,
  ) async {
    try {
      await dio.post('activities/review', data: {
        'activity_id': activityResponse?.result?.id,
        'comment': feedback,
        'score': rating.value,
      });
    } on DioError catch (e) {}
  }

  num getAdditionalCost(String type) {
    if (type == 'RENT') {
      return num.tryParse(
              activityResponse?.result?.weRentResponse?.additionalCost ??
                  "0") ??
          0;
    } else if (type == 'DRIVE_YOUR_CAR') {
      return num.tryParse(
              activityResponse?.result?.driveYourCarResponse?.additionalCost ??
                  "0") ??
          0;
    } else if (type == 'ASSISTANT') {
      return num.tryParse(
              activityResponse?.result?.assistant?.additionalCost ?? "0") ??
          0;
    } else if (type == 'RIDE') {
      return num.tryParse(
              activityResponse?.result?.ride?.additionalCost ?? "0") ??
          0;
    } else {
      return 0;
    }
  }
}

class AssistantOrderListWidget extends StatelessWidget {
  ActivityDetail activity;

  AssistantOrderListWidget(this.activity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail order',
          style: inforTitleText,
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 12),
          shrinkWrap: true,
          primary: false,
          itemCount: activity?.assistant?.lists?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final item = activity?.assistant?.lists?[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item?.name ?? "",
                          style: orderReTextBlack,
                        ),
                      ),
                      Text(
                        'x${item?.piece ?? "0"}',
                        style: orderReTextBlack,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
              height: 16,
            );
          },
        ),
      ],
    );
  }
}

class AssistantSummaryWidget extends StatelessWidget {
  ActivityDetail activity;

  AssistantSummaryWidget(this.activity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Service Cost',
              style: GoogleFonts.kanit().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff858585)),
            ),
            Text(
              '${activity.assistant?.cost ?? ""} ฿',
              style: GoogleFonts.kanit().copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                  decoration: paymentButton,
                  child: Text.rich(
                    TextSpan(
                      text: activity?.paymentMethod ?? '',
                      style: paymentButtonText,
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  if (activity?.couponId == null) {
                    return SizedBox(
                      height: 0,
                    );
                  }
                  return Expanded(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                        decoration: typeButton,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/tag.png',
                                fit: BoxFit.fill,
                                height: 10,
                                width: 14,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  child: Text(
                                "ride50Freeiks...",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: sumButtonText,
                              )),
                            ),
                          ],
                        )),
                  );
                }),
              ],
            )),
            Text(
              '${activity?.points ?? 0}pts',
              style: poinText,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Divider(
          color: Color(0xFFE6E6E6),
          thickness: 1,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Product price',
              style: GoogleFonts.kanit().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Text(
              '${activity.assistant?.estimatePrice ?? ""} ฿',
              style: GoogleFonts.kanit().copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
          decoration: paymentButton,
          child: Text.rich(
            TextSpan(
              text: activity?.paymentMethod ?? '',
              style: paymentButtonText,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class ItemDestination extends StatelessWidget {
  Destinations? item;

  ItemDestination(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: SvgPicture.asset(item?.destination?.icon ?? ""),
              margin: EdgeInsets.only(top: 8)),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
                children: [
                  Text(
                    item?.destination?.name ?? "",
                    style: GoogleFonts.kanit(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    item?.destination?.address ?? "",
                    style: GoogleFonts.kanit(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Color(0xff848484)),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ))
        ],
      ),
    );
  }
}


extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(Object getCompareValue(T e)) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
        result.add(element);
      }
    });

    return result;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/controllers/checkin_checkout_controller.dart';
import 'package:we_link/constant/colosrConstants.dart';

// ignore: must_be_immutable
class CheckInCheckOutScreen extends StatelessWidget {
  CheckInCheckOutScreen({Key? key}) : super(key: key);

  final controller = Get.put(CheckInCheckOutController());

  Color checkInColor = const Color(0xFF564FF0);
  Color checkOutColor = const Color(0xFFFF855E);
  Color disableColor = const Color(0xFFDBDBDB);

  Color checkInTextColor = const Color(0xFF189B58);
  Color checkOutTextColor = const Color(0xFFFF855E);
  Color dismissTextColor = const Color(0xFFCDCDCD);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        Get.back();
        return Future.value(true);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                width: Get.width,
                padding: const EdgeInsets.only(right: 24, bottom: 24),
                decoration: const BoxDecoration(
                  color: Color(0xFF191919),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.back();
                          },
                          child: Image.asset('assets/staff_back.png')),
                    ),
                    const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 35,
                    )
                  ],
                ),
              ),
              Obx(() => controller.isLoading.isTrue
                  ? Column(
                      children: [
                        SizedBox(height: (Get.height - 120) / 2),
                        const CircularProgressIndicator(color: yellowColor),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 18),
                          height: 111,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE2F2FC),
                                  border: Border.all(
                                    color: const Color(0xFF2AD4DF),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(40, 40)),
                                ),
                                child: Center(
                                  child: Obx(() => Text(
                                        controller.profileName.value[0],
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.kanit(
                                            color: const Color(0xFF2AD4DF),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 36),
                                      )),
                                ),
                              ),
                              const SizedBox(width: 21),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => Text(
                                          controller.profileName.value,
                                          style: GoogleFonts.kanit(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19),
                                        )),
                                    Obx(() => Text(
                                          '${controller.staffRoleTitle.value} - ${controller.phone.value}',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.kanit(
                                              color: const Color.fromRGBO(
                                                  103, 103, 103, 1),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15),
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Status : ',
                                          style: GoogleFonts.kanit(
                                              color: const Color(0xFFA7A7A7),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        ),
                                        Obx(() => Text(
                                              controller.status.isTrue
                                                  ? 'online'
                                                  : 'offline',
                                              style: GoogleFonts.kanit(
                                                  color: controller
                                                          .status.isTrue
                                                      ? const Color(0xFF189B58)
                                                      : Colors.redAccent,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 18),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: Get.width,
                              height: 160 + 200,
                              color: const Color(0xFF189B58),
                            ),
                            Positioned(
                              top: 45,
                              width: 230,
                              height: 230,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF189B58),
                                  borderRadius: BorderRadius.circular(200),
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: Get.width,
                                height: 200,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 60,
                              width: 200,
                              height: 200,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(200),
                                  border: Border.all(
                                      color: const Color(0xFF189B58),
                                      width: 1.5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx(() => Text(
                                          controller.displayClockInDate.value,
                                          style: GoogleFonts.kanit(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/icons/clock.png",
                                            width: 20, height: 20),
                                        const SizedBox(width: 10),
                                        Obx(() => Text(
                                              controller.displayClockInTime
                                                          .value ==
                                                      ""
                                                  ? "เข้างาน :              "
                                                  : "เข้างาน : ${controller.displayClockInTime.value}",
                                              style: GoogleFonts.kanit(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                  color: controller
                                                              .displayClockInTime
                                                              .value ==
                                                          ""
                                                      ? dismissTextColor
                                                      : checkInTextColor),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/icons/clock.png",
                                            width: 20, height: 20),
                                        const SizedBox(width: 10),
                                        Obx(() => Text(
                                              controller.displayClockOutTime
                                                          .value ==
                                                      ""
                                                  ? "ออกงาน :            "
                                                  : "ออกงาน : ${controller.displayClockOutTime.value}",
                                              style: GoogleFonts.kanit(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                  color: controller
                                                              .displayClockOutTime
                                                              .value ==
                                                          ""
                                                      ? dismissTextColor
                                                      : checkOutColor),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 23,
                              child: Obx(() => TextButton(
                                    onPressed: controller.btnState.value ==
                                            ButtonStatus.disableButton.index
                                        ? null
                                        : () => controller.onClickBtn(),
                                    child: Container(
                                      width: 120,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: controller.btnState.value ==
                                                  ButtonStatus
                                                      .disableButton.index
                                              ? disableColor
                                              : controller.btnState.value ==
                                                      ButtonStatus
                                                          .waitCheckIn.index
                                                  ? checkInColor
                                                  : checkOutColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          controller.btnState.value ==
                                                  ButtonStatus.waitCheckIn.index
                                              ? 'Check in'
                                              : 'Check out',
                                          style: GoogleFonts.kanit(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              ListMenu(
                                title: 'Report Schedule',
                                onPress: () {},
                              ),
                              const SizedBox(height: 13),
                              ListMenu(
                                title: 'Report of work',
                                onPress: () {},
                              ),
                              const SizedBox(height: 13),
                              ListMenu(
                                title: 'Leave',
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListMenu({required String title, required Function onPress}) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        width: Get.width,
        height: 42,
        margin: const EdgeInsets.symmetric(horizontal: 23),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(11),
            topRight: Radius.circular(11),
            bottomLeft: Radius.circular(11),
            bottomRight: Radius.circular(11),
          ),
          color: Color.fromRGBO(246, 246, 246, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.kanit(
                    color: const Color.fromRGBO(63, 63, 63, 1),
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(18, 18)),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

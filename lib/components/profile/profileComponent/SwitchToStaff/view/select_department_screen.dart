import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/controllers/select_department_controller.dart';
import 'package:we_link/constant/colosrConstants.dart';

class SelectDepartmentScreen extends StatelessWidget {
  SelectDepartmentScreen({Key? key}) : super(key: key);

  final controller = Get.put(SelectDepartmentController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.isTrue
        ? Container(
            color: Colors.white,
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CircularProgressIndicator(color: yellowColor),
              ],
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 67),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Select",
                                    style: GoogleFonts.kanit(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                                Text("Department",
                                    style: GoogleFonts.kanit(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ],
                            ),
                            InkWell(
                              onTap: () => Get.back(),
                              child: Container(
                                  width: 37,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEBEBEB),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Image.asset("assets/icons/close_x.png",
                                      scale: 1.5)),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                            'You can choose to go to the stores that you are associated with.\nPlease select a store below. and press the "confirm" button',
                            style: GoogleFonts.kanit(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF706F6F))),
                        const SizedBox(height: 32),
                        Obx(() => Column(
                              children: [
                                for (int i = 0;
                                    i < controller.listDepartment.length;
                                    i++) ...[
                                  ListDepartment(
                                    title: controller.listDepartment[i]
                                        .merchantName ?? '',
                                    image: controller.listDepartment[i]
                                        .merchantImage ?? '',
                                    onPress: () => controller.setDepartment(i),
                                    isActive: controller.listStaffId[i],
                                  ),
                                ],
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                child: TextButton(
                  onPressed: () => controller.goToCheckInCheckOutScreen(),
                  child: Container(
                    width: Get.width - 21 - 21,
                    height: 43,
                    decoration: BoxDecoration(
                        color: const Color(0xFF191919),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: GoogleFonts.kanit(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));
  }

  // ignore: non_constant_identifier_names
  Widget ListDepartment({
    required String title,
    required String image,
    required Function()? onPress,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        width: Get.width,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: isActive ? const Color(0xFF189B58) : Colors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: isActive
                          ? const Color(0xFF189B58)
                          : const Color(0xFF8E8E93),
                    ),
                  ),
                ],
              ),
              isActive
                  ? Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: const Color(0xFF189B58),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.check,
                          color: Colors.white, size: 16),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

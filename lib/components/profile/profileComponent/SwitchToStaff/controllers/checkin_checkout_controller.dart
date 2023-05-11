import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/api/checkin_checkout_api.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/models/profile_menu_model.dart'
    as pm;
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/models/staff_report_model.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/widgets/dialog.dart';
import 'package:we_link/core/constants/key_constants.dart';
import 'package:we_link/di/app_module.dart';

enum ButtonStatus { waitCheckIn, waitCheckOut, disableButton }

class CheckInCheckOutController extends GetxController {
  var userDetail = appStorage.read(KEY_USER_DETAIL) ?? '';

  final api = Get.put(CheckInCheckOutApi());

  pm.Data get data => Get.arguments;
  RxBool isLoading = true.obs;

  // String? get user => userDetail.name;
  // String? get role => userDetail.role;
  // String? get status => userDetail.status;

  RxString profileName = "".obs;
  RxString staffRoleTitle = "".obs;
  RxString phone = "".obs;
  RxBool status = false.obs;

  RxString displayClockInDate = "".obs;
  RxString displayClockInTime = "".obs;
  RxString displayClockOutTime = "".obs;

  // RxInt btnState = ButtonStatus.disableButton.index.obs;
  RxInt btnState = ButtonStatus.waitCheckOut.index.obs;

  DateTime? now;

  @override
  void onInit() {
    super.onInit();

    now = DateTime.now();
    DateTime date = DateTime(now!.year, now!.month, now!.day);

    getStaffHome(now!);
  }

  void getStaffHome(DateTime now) async {
    String query = "?staff_id=${data.staffId}";
    Response resp = await api.getStaffHome(query);

    if (resp.isOk) {
      StaffReport staffReport = StaffReport.fromJson(resp.body);

      profileName.value = staffReport.data!.profileName ?? '';
      staffRoleTitle.value = staffReport.data!.staffRoleTitle ?? '';
      phone.value = staffReport.data!.phone ?? '';
      status.value = staffReport.data!.clockIn != null;

      String? clockIn = staffReport.data!.clockIn;
      String? clockOut = staffReport.data!.clockOut;

      if (clockIn != null) {
        String clockInDate = clockIn.split('T')[0];
        String clockInTime = clockIn.split('T')[1];
        List clockInDateList = clockInDate.split("-"); // 2023-03-07
        List clockInTimeList = clockInTime.split(":"); // 15:31:20

        displayClockInDate.value =
            "${int.parse(clockInDateList[2])} ${monthToString(int.parse(clockInDateList[1]))} ${calculateBuddhist(int.parse(clockInDateList[0]))}";
        displayClockInTime.value =
            "${clockInTimeList[0]} : ${clockInTimeList[1]}";
      } else {
        displayClockInDate.value =
            "${now.day} ${monthToString(now.month)} ${calculateBuddhist(now.year)}";
      }

      if (clockOut != null) {
        String clockOutDate = clockOut.split('T')[0];
        String clockOutTime = clockOut.split('T')[1];
        List clockOutDateList = clockOutDate.split("-"); // 2023-03-07
        List clockOutTimeList = clockOutTime.split(":"); // 15:31:20

        displayClockOutTime.value =
            "${clockOutTimeList[0]} : ${clockOutTimeList[1]}";
      }

      if (clockIn == null) {
        btnState.value = ButtonStatus.waitCheckIn.index;
      } else if (clockOut == null) {
        btnState.value = ButtonStatus.waitCheckOut.index;
      } else {
        btnState.value = ButtonStatus.disableButton.index;
      }
    }

    isLoading(false);
  }

  int calculateBuddhist(int b) {
    return b + 543;
  }

  String monthToString(int m) {
    Map<int, String> month = {
      1: "มกราคม",
      2: "กุมภาพันธ์",
      3: "มีนาคม",
      4: "เมษายน",
      5: "พฤษภาคม",
      6: "มิถุนายน",
      7: "กรกฎาคม",
      8: "สิงหาคม",
      9: "กันยายน",
      10: "ตุลาคม",
      11: "พฤศจิกายน",
      12: "ธันวาคม",
    };

    return month[m] as String;
  }

  void onClickBtn() {
    if (btnState.value == ButtonStatus.waitCheckIn.index) {
      DialogMessage.showInfo(
        title: 'Check in?',
        content: 'Please press confirm to check in',
        btnText: 'Done',
        onConfirm: () async {
          Get.back();

          String formattedDatetime =
              DateFormat('yyyy-MM-dd HH:mm').format(now!);

          Map<String, dynamic> body = {
            "staff_id": data.staffId,
            "timestamp": formattedDatetime
          };
          print(body);

          Response resp = await api.postClockIn(body);

          if (resp.isOk) {
            getStaffHome(now!);
            checkInCallback();
          } else {
            DialogMessage.showError(content: resp.body["message"]);
          }
        },
        onCancle: () => Get.back(),
      );
    } else if (btnState.value == ButtonStatus.waitCheckOut.index) {
      DialogMessage.showInfo(
        title: 'Check Out?',
        content: 'Please press confirm to check in',
        btnText: 'Done',
        onConfirm: () async {
          Get.back();

          String formattedDatetime =
              DateFormat('yyyy-MM-dd HH:mm').format(now!);

          Map<String, dynamic> body = {
            "staff_id": data.staffId,
            "timestamp": formattedDatetime
          };
          Response resp = await api.postClockOut(body);

          if (resp.isOk) {
            getStaffHome(now!);
            checkOutCallback();
          } else {
            DialogMessage.showError(content: resp.body["message"]);
          }
        },
        onCancle: () => Get.back(),
      );
    }
  }

  void checkInCallback() {
    DialogMessage.showSuccess(
      title: 'Check in Success',
      content: 'Have a good day',
      btnText: 'Done',
      onPressed: () => Get.back(),
    );
  }

  void checkOutCallback() {
    DialogMessage.showSuccess(
      title: 'Check out Success',
      content: 'Thank you all days',
      btnText: 'Done',
      onPressed: () => Get.back(),
    );
  }
}

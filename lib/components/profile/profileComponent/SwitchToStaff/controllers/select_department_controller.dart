import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/api/checkin_checkout_api.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/configs/share_prefer.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/models/profile_menu_model.dart'
    as pm;
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/models/staff_report_model.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/view/checkin_checkout_screen.dart';

class SelectDepartmentController extends GetxController {
  final api = Get.put(CheckInCheckOutApi());

  pm.ProfileMenu get profileMenu => Get.arguments;
  RxList<pm.Data> listDepartment = <pm.Data>[].obs;
  RxList<bool> listStaffId = <bool>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    checkList();
    initListDepartment();
  }

  void checkList() async {
    final prefs = await SharedPreferences.getInstance();
    int? staffId = prefs.getInt(PreferKey.staffId);

    if (staffId == null) {
      isLoading(false);
      return;
    }

    String query = "?staff_id=$staffId";
    Response resp = await api.getStaffHome(query);

    if (resp.isOk) {
      StaffReport staffReport = StaffReport.fromJson(resp.body);

      String? clockIn = staffReport.data!.clockIn;
      pm.Data? arguments;

      for (var elem in listDepartment) {
        if (elem.staffId == staffId) {
          arguments = elem;
        }
      }

      if(arguments == null) {
        isLoading(false);
        return;
      }

      if (clockIn != null) {
        Get.to(
          () => CheckInCheckOutScreen(),
          arguments: arguments as pm.Data,
        );
      }

      isLoading(false);
    }
  }

  void initListDepartment() {
    listDepartment.value = profileMenu.data ?? [];

    for (int i = 0; i < listDepartment.length; i++) {
      listStaffId.add(false);
    }

    listStaffId[0] = true;
  }

  void setDepartment(int i) {
    for (int j = 0; j < listStaffId.length; j++) {
      listStaffId[j] = false;
    }

    listStaffId[i] = true;
  }

  void goToCheckInCheckOutScreen() async {
    pm.Data data = listDepartment[listStaffId.indexOf(true)];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(PreferKey.staffId, data.staffId as int);

    print(data.toJson());

    Get.to(
      () => CheckInCheckOutScreen(),
      arguments: data,
    );
  }
}

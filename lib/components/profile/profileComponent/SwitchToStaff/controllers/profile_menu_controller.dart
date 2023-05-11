import 'package:get/get.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/api/profile_menu_api.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/models/profile_menu_model.dart';
import 'package:we_link/core/constants/key_constants.dart';
import 'package:we_link/di/app_module.dart';

class ProfileMenuController extends GetxController {
  final api = Get.put(ProfileMenuApi());

  var userDetail = appStorage.read(KEY_USER_DETAIL) ?? '';

  RxBool switchStaffFlag = false.obs;
  ProfileMenu? profileMenu;

  @override
  void onInit() {
    super.onInit();

    getDepartment();
  }

  void getDepartment() async {
    Map<String, dynamic> query = {"phone": userDetail.phone};
    // Map<String, dynamic> query = {"phone": "0900000001"};

    Response resp = await api.getDepartment(query);

    if (resp.isOk) {
      profileMenu = ProfileMenu.fromJson(resp.body);

      if (profileMenu!.data!.isNotEmpty) {
        switchStaffFlag(true);
      }
    }
  }
}

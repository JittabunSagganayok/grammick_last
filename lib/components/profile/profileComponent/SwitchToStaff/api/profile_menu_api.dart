import 'package:get/get.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/api/api_base.dart';

class ProfileMenuApi extends BaseApi {
  Future<Response> getDepartment(Map<String, dynamic> query) =>
      get('/partner/staff-report/merchant', query: query);
}

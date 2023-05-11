import 'package:get/get.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/api/api_base.dart';

class CheckInCheckOutApi extends BaseApi {
  Future<Response> getStaffHome(String query) =>
      get('/partner/staff-report/home$query');

  Future<Response> postClockIn(Map<String, dynamic> body) =>
      post('/partner/staff-report/clock-in', body);

  Future<Response> postClockOut(Map<String, dynamic> body) =>
      post('/partner/staff-report/clock-out', body);
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/activity/activityBody.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/activity/history/get_activity_history_list_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/main_screen.dart';

class MyActivityScreen extends StatefulWidget {
  MyActivityScreen({Key? key}) : super(key: key);

  @override
  State<MyActivityScreen> createState() => _MyActivityScreenState();
}

class _MyActivityScreenState
    extends AppState<MyActivityScreen, MyActivityViewModel> {
  @override
  MyActivityViewModel initViewModel(MyActivityViewModel viewModel) {
    viewModel.getActivityList();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, MyActivityViewModel viewModel) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            shape: appbarBorder,
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () async {
                  navigator?.pop();
                  Get.to(MainScreen());
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            title: Text(
              'My Activity',
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: Obx(() {
          if (viewModel.loading.value == true) {
            return SizedBox(
                width: Get.width,
                height: Get.height,
                child: const Center(
                  child: CircularProgressIndicator(color: yellowColor,),
                ));
          } else {
            return activityBody(viewModel.activityList,viewModel.totalBadge);
          }
        }));
  }
}

class MyActivityViewModel extends GetxController {
  Dio dio;

  MyActivityViewModel(this.dio);

  var activityList = <ActivityList>[].obs;
  var loading = false.obs;
  var totalBadge = 0;

  Future getActivityList() async {
    loading.value = true;
    var response = await dio.get(
      'activities',
    );
    var data = GetActivityHistoryListResponse.fromJson(response.data);
    activityList.value = data.result ?? [];
    totalBadge = activityList.value.where((element) => element.status == 'BOOK').toList()?.length ?? 0;
    loading.value = false;
  }
}

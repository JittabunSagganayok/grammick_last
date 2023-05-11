import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/di/app_module.dart';

import '../../components/alert/deletePlaceAlert.dart';
import '../../constant/colosrConstants.dart';
import '../../constant/stylesConstants.dart';
import '../../views/main_screen.dart';
import '../base/base_we_state.dart';

class ReportProblemScreen extends StatefulWidget {
  static String screen = '/reportProblemScreen';

  ReportProblemScreen({Key? key, this.cancelOrder}) : super(key: key);
  final bool? cancelOrder;

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState
    extends AppState<ReportProblemScreen, ReportOrderViewModel> {
  var problemList = ['The situation is not good', "Help,us"];

  TextEditingController textEditingController = TextEditingController();

  @override
  ReportOrderViewModel initViewModel(ReportOrderViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ReportOrderViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          title: Text(
            widget.cancelOrder == true ? 'Cancel' : 'Report this problem',
            style: titleWhiteAppbar,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 36, right: 36),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 33, bottom: 14),
              alignment: Alignment.topLeft,
              child: Text(
                widget.cancelOrder == true
                    ? 'Add Description to cancel'
                    : "Add Description to report",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Kanit'),
              ),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: textEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                  counterText: '',
                  // hintText: 'Message..',
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Kanit'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Color(0xFFBBBBBB))),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Color(0xFFBBBBBB)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Wrap(children: [
                for (var i = 0; i < problemList.length; i++)
                  InkWell(
                    onTap: () {
                      textEditingController.text = problemList[i];
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(19, 12, 19, 12),
                      margin: EdgeInsets.only(bottom: 8, right: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        "${problemList[i]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                  ),
              ]),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: yellowColor,
                  textStyle: TextStyle(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  side: BorderSide(
                    width: 0.0,
                    color: yellowColor,
                  ),
                ),
                onPressed: () async {
                  if (widget.cancelOrder == true) {
                    var result =
                        await displayConfirmationToCancelOrder(context);
                    if (result != null) {
                      await viewModel.cancelOrder();
                      Get.offAll(MainScreen());
                    }
                  } else {
                    await viewModel.reportOrder(
                      textEditingController.text,
                    );
                    Get.offAll(MainScreen());
                  }
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ReportOrderViewModel extends GetxController {
  Dio dio;

  ReportOrderViewModel(this.dio);

  Future reportOrder(String reportProblem) async {
    await dio.post('activities/report/${weRideOrderResponse?.id ?? -1}', data: {
      'message': reportProblem,
    });
  }

  Future cancelOrder() async {
    await dio.post(
      'activities/${weRideOrderResponse?.id}/cancel',
    );
  }
}

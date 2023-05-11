import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../constant/stylesConstants.dart';
import '../../models/other/app_help_center_response.dart';
import '../../models/register/term_cond_reponse.dart';

class TermConditionController extends GetxController {
  Dio dio;

  TermConditionController(this.dio);

  var termAndCondition = HelpCenter().obs;

  var isLoaded = false.obs;

  loadTermCondition() async {
    isLoaded.value = true;
    var resp = await dio.get('admin/term-conditions?skip&take');
    printError(info: resp.data.toString());
    var termResp = AppHelpCenterResponse.fromJson(resp.data);
    termAndCondition.value = termResp.result!;
    isLoaded.value = false;
  }
}

class SignUpTermConditionScreen extends StatefulWidget {
  SignUpTermConditionScreen({Key? key}) : super(key: key);

  @override
  State<SignUpTermConditionScreen> createState() =>
      _SignUpTermConditionScreenState();
}

class _SignUpTermConditionScreenState
    extends AppState<SignUpTermConditionScreen, TermConditionController> {

  @override
  TermConditionController initViewModel(TermConditionController viewModel) {
    viewModel.loadTermCondition();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, TermConditionController viewModel) {
    final mainContent = Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 70, top: 30),
      child: Obx(() {
        if (viewModel.isLoaded.isTrue) {
          return LoadingFullscreen();
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: SingleChildScrollView(
                  child: Html(
                    data : viewModel.termAndCondition.value.description,
                    shrinkWrap: true,
                  ),
                ),
              )),
            ],
          );
        }
      }),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: const Color(0xFF101010),
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: appbarBorder,
          leading: Container(
            margin: const EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Term & Condition',
            style: titleWhiteAppbar,
          ),
        ),
      ),
      body: SafeArea(
        child: mainContent,
      ),
    );
  }
}

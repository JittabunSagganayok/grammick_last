import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../../constant/stylesConstants.dart';
import '../../../di/app_module.dart';
import '../../../models/wallet/check_payment_status_response.dart';
import '../../../models/wallet/my_qr_response.dart';
import '../../alert/asking_alert.dart';
import '../../alert/weWallet/receivedSuccess.dart';
import '../myWallet.dart';

class QrPaymentScreen extends StatefulWidget {
  String? qrCode;
  bool isContinueOrder = false;

  QrPaymentScreen({
    Key? key,
    this.qrCode,
    this.isContinueOrder = false,
  }) : super(key: key);

  @override
  State<QrPaymentScreen> createState() => _QrPaymentScreenState(qrCode);
}

class _QrPaymentScreenState
    extends AppState<QrPaymentScreen, QrPaymentViewModel>
    with WidgetsBindingObserver {
  String? qrCode;

  _QrPaymentScreenState(String? qrCode) {
    this.qrCode = qrCode;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        viewModel.checkPaymentIsSuccess(success: () async {
          if (qrCode != null) {
            await receivedSuccess(context, () {});

            if (widget.isContinueOrder) {
              Navigator.of(context).pop(true);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => myWallet()),
                  ModalRoute.withName('/'));
            }
          }
        });
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  QrPaymentViewModel initViewModel(QrPaymentViewModel viewModel) {
    if (qrCode == null) {
      viewModel.getMyQr();
    } else {
      viewModel.setThaiQrPayment(qrCode ?? "");
    }
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, QrPaymentViewModel viewModel) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
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
                onPressed: () async {

                  viewModel.checkPaymentIsSuccess(success: () {
                    Navigator.of(context).pop(true);
                  }, failed: () {
                    askingAlert(context,
                        message: 'Do you want to close?',
                        title: 'Payment not complete', cancel: () {
                      navigator?.pop();
                    });
                  });

                  // Get.dialog(LoadingFullscreen(
                  //   backgroundColor: Colors.black45,
                  // )).then((value) async {
                  //   if (value != null) {
                  //     await receivedSuccess(context, () {});
                  //
                  //     if (widget.isContinueOrder) {
                  //       Navigator.of(context).pop(true);
                  //     } else {
                  //       Navigator.pushAndRemoveUntil(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (BuildContext context) => myWallet()),
                  //           ModalRoute.withName('/'));
                  //     }
                  //   } else {
                  //     Navigator.pop(context);
                  //   }
                  // });
                  //
                  // await viewModel.checkPaymentIsSuccess(failed: () {
                  //   Navigator.pop(context);
                  // }, success: () async {
                  //   if (qrCode != null) {
                  //     Navigator.of(context).pop(true);
                  //   }
                  // });
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            centerTitle: true,
            title: Text(
              qrCode != null ? 'Thai QR Payment' : 'My QR code',
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Obx(() => Center(
                    child: viewModel.imageFromBase64String(
                        viewModel.qrCode.value.toString()),
                  )),
              // GestureDetector(
              //   child:
              //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //     Container(
              //       margin: const EdgeInsets.only(right: 15),
              //       child: Image.asset(
              //         'assets/images/save.png',
              //         fit: BoxFit.fill,
              //         height: 20,
              //         width: 20,
              //       ),
              //     ),
              //     Container(
              //         child: const Text("Save",
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.w800,
              //                 fontFamily: 'Kanit'))),
              //   ]),
              // ),
              const SizedBox(
                height: 140,
              ),
              Builder(builder: (context) {
                if (qrCode == null) {
                  return const SizedBox(
                    height: 0,
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  height: 43,
                  width: 168,
                  child: OutlinedButton(
                    style: filterOutlinedButton,
                    onPressed: () {
                      viewModel.checkPaymentIsSuccess(success: () async {
                        if (qrCode != null) {
                          await receivedSuccess(context, () {});

                          if (widget.isContinueOrder) {
                            Navigator.of(context).pop(true);
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        myWallet()),
                                ModalRoute.withName('/'));
                          }
                        }
                      });
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                );
              }),
            ],
          ),
        )),
      ),
    );
  }
}

class QrPaymentViewModel extends GetxController {
  Dio dio;

  QrPaymentViewModel(this.dio);

  var qrCode = ''.obs;

  void setThaiQrPayment(String qrCode) {
    this.qrCode.value = qrCode;
  }

  Future getMyQr() async {
    var response = await dio.get('wallets/qr-code');
    var data = MyQrResponse.fromJson(response.data);
    qrCode.value = data.result ?? "";
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  Future checkPaymentIsSuccess({
    required Function() success,
    Function? failed,
  }) async {
    var response =
        await dio.get('activities/payment/$paymentTransactionId/status');
    var data = CheckPaymentStatusResponse.fromJson(response.data);

    if (data.result?.status.toString().toLowerCase() == 'success') {
      await dio.post('wallets/top-up', data: {
        'payment_transection_id': paymentTransactionId,
      });

      success.call();
    } else {
      failed?.call();
    }
  }
}

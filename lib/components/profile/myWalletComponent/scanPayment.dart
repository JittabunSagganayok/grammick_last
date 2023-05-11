import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:we_link/components/profile/myWalletComponent/transfer.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';

class ScanPaymentScreen extends StatefulWidget {
  var isPayment = false;
  var totalAmount = '';

  ScanPaymentScreen({
    this.isPayment = false,
    this.totalAmount = "",
  });

  @override
  State<ScanPaymentScreen> createState() => _ScanPaymentScreenState();
}

class _ScanPaymentScreenState
    extends AppState<ScanPaymentScreen, ScanPaymentViewModel> {
  bool flashOn = false;
  Barcode? result;
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  Widget _textWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
        ),
        Center(
            child: Text(
          "Please place the qr or barcode",
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              fontFamily: 'Kanit'),
        )),
        Center(
            child: Text(
          "in the designated area.",
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              fontFamily: 'Kanit'),
        )),
      ],
    );
  }

  void _onQRViewCreated(BuildContext context) {
    qrController?.scannedDataStream.listen((barcode) async {
      qrController?.pauseCamera();

      var result = await Navigator.of(context).push(_createRoute(barcode.code ?? ""));

      if (result != null && widget.isPayment) {
        Navigator.of(context).pop(true);
      } else {
        qrController?.resumeCamera();
      }
    });
  }

  Route _createRoute(
    String code,
  ) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TransferScreen(
        qrCode: code,
        totalAmount: widget?.totalAmount ?? "",
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    qrController?.pauseCamera();
    qrController?.stopCamera();
    qrController?.dispose();
    super.dispose();
  }

  @override
  ScanPaymentViewModel initViewModel(ScanPaymentViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ScanPaymentViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/goBack.png'),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Check details',
          style: titleWhiteAppbar,
        ),
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     if (qrController != null) {
          //       qrController!.toggleFlash();
          //       setState(() {
          //         flashOn = !flashOn;
          //       });
          //     }
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(right: 20),
          //     child: CircleAvatar(
          //       radius: 18,
          //       backgroundColor: Color.fromRGBO(251, 251, 251, 0.05),
          //       child: Image.asset(
          //         'assets/images/flash.png',
          //         width: 18,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Obx(() {
              if (viewModel.isShow.value == false) {
                return SizedBox(
                  height: 0,
                );
              }
              return QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  qrController = controller;
                  qrController?.resumeCamera();
                  _onQRViewCreated(context);
                },
                overlay: QrScannerOverlayShape(
                  borderRadius: 10,
                  borderWidth: 10,
                  borderColor: Colors.white,
                ),
              );
            }),
          ),
          _textWidget(context)
        ],
      ),
    );
  }
}

class ScanPaymentViewModel extends GetxController {
  var isShow = true.obs;
}

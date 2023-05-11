import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../constant/stylesConstants.dart';
import '../../../di/app_module.dart';
import '../../../models/wallet/check_payment_status_response.dart';
import '../../alert/asking_alert.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  final Function()? onFinish;
  final bool isPaymentOrder;

  // final Function? onClose;

  const PaymentWebView({
    Key? key,
    this.onFinish,
    required this.url,
    this.isPaymentOrder = false,
  }) : super(key: key);

  @override
  State<PaymentWebView> createState() => PaymentWebViewState();
}

class PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    webViewPaymentViewModel.isPaymentOrder = widget.isPaymentOrder;

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            Get.dialog(LoadingFullscreen(
              backgroundColor: Colors.black45,
            ));
          },
          onPageFinished: (String url) {
            navigator?.pop();
            webViewPaymentViewModel.checkPaymentIsSuccess(
                success: () {
                  widget.onFinish?.call();
                },
                notSuccess: () {});
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  final webViewPaymentViewModel =
      Get.put(WebViewPaymentViewModel(appModule.get()));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
                    webViewPaymentViewModel.checkPaymentIsSuccess(success: () {
                      widget.onFinish?.call();
                    }, notSuccess: () {
                      askingAlert(context,
                          message: 'Do you want to close?',
                          title: 'Payment not complete', cancel: () {
                        navigator?.pop();
                      });
                    });
                  },
                  icon: Image.asset('assets/images/goBack.png'),
                ),
              ),
              centerTitle: true,
              title: Text(
                'Credit/Debit Payment',
                style: titleWhiteAppbar,
              ),
            ),
          ),
          body: WebViewWidget(controller: _controller),
        ),
        onWillPop: () => Future.value(false));
  }
}

class WebViewPaymentViewModel extends GetxController {
  Dio dio;

  bool isPaymentOrder = false;

  WebViewPaymentViewModel(this.dio);

  void checkPaymentIsSuccess({
    required Function() success,
    required Function() notSuccess,
  }) async {
    var response =
        await dio.get('activities/payment/$paymentTransactionId/status');
    var data = CheckPaymentStatusResponse.fromJson(response.data);

    if (data.result?.status.toString().toLowerCase() == 'success' &&
        isPaymentOrder == false) {
      await dio.post('wallets/top-up', data: {
        'payment_transection_id': paymentTransactionId,
      });

      success.call();
    } else {
      notSuccess.call();
    }
  }
}

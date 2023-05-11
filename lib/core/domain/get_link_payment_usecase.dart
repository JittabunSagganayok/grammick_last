import 'package:dio/dio.dart';
import 'package:we_link/models/wallet/payment_link_response.dart';

import '../../di/app_module.dart';

abstract class GetLinkPaymentUseCase{
  Future<PaymentLinkResponse> getLinkPayment(num amount);
}

class GetLinkPaymentUseCaseImpl extends GetLinkPaymentUseCase{

  Dio dio;

  GetLinkPaymentUseCaseImpl(this.dio);

  @override
  Future<PaymentLinkResponse> getLinkPayment(num amount) async{
      var response = await dio.post('activities/payment/link', data: {
        'amount': amount,
      });
      var data = PaymentLinkResponse.fromJson(response.data);
      paymentTransactionId = data.result?.paymentTransectionId ?? "";

      return data;
    }

}
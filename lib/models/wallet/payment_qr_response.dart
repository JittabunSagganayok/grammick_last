import 'dart:convert';
/// message : "success"
/// result : {"payment_transection_id":"1672684402795","qr_payment":"","acquirer":"th_ksher"}

PaymentQrResponse paymentQrResponseFromJson(String str) => PaymentQrResponse.fromJson(json.decode(str));
String paymentQrResponseToJson(PaymentQrResponse data) => json.encode(data.toJson());
class PaymentQrResponse {
  PaymentQrResponse({
      this.message, 
      this.result,});

  PaymentQrResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? PaymentQr.fromJson(json['result']) : null;
  }
  String? message;
  PaymentQr? result;
PaymentQrResponse copyWith({  String? message,
  PaymentQr? result,
}) => PaymentQrResponse(  message: message ?? this.message,
  result: result ?? this.result,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

/// payment_transection_id : "1672684402795"
/// qr_payment : ""
/// acquirer : "th_ksher"

PaymentQr resultFromJson(String str) => PaymentQr.fromJson(json.decode(str));
String resultToJson(PaymentQr data) => json.encode(data.toJson());
class PaymentQr {
  PaymentQr({
      this.paymentTransectionId, 
      this.qrPayment, 
      this.acquirer,});

  PaymentQr.fromJson(dynamic json) {
    paymentTransectionId = json['payment_transection_id'];
    qrPayment = json['qr_payment'].toString().replaceAll('data:image/png;base64,', '');
    acquirer = json['acquirer'];
  }
  String? paymentTransectionId;
  String? qrPayment;
  String? acquirer;
PaymentQr copyWith({  String? paymentTransectionId,
  String? qrPayment,
  String? acquirer,
}) => PaymentQr(  paymentTransectionId: paymentTransectionId ?? this.paymentTransectionId,
  qrPayment: qrPayment ?? this.qrPayment,
  acquirer: acquirer ?? this.acquirer,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_transection_id'] = paymentTransectionId;
    map['qr_payment'] = qrPayment;
    map['acquirer'] = acquirer;
    return map;
  }

}
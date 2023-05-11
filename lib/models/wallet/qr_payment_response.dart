import 'dart:convert';

class QrPaymentResponse {
  QrPaymentResponse({
    required this.message,
    required this.result,
  });

  final String message;
  final Result result;

  factory QrPaymentResponse.fromJson(String str) => QrPaymentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QrPaymentResponse.fromMap(Map<String, dynamic> json) => QrPaymentResponse(
    message: json["message"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    required this.paymentTransectionId,
    required this.qrPayment,
    required this.acquirer,
  });

  final String paymentTransectionId;
  final String qrPayment;
  final String acquirer;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    paymentTransectionId: json["payment_transection_id"] ?? '',
    qrPayment: json["qr_payment"] ?? '',
    acquirer: json["acquirer"] ?? '',
  );

  Map<String, dynamic> toMap() => {
    "payment_transection_id": paymentTransectionId,
    "qr_payment": qrPayment,
    "acquirer": acquirer,
  };
}
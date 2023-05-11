import 'dart:convert';

class PaymentStatusResponse {
  PaymentStatusResponse({
    required this.message,
    required this.result,
  });

  final String message;
  final Result result;

  factory PaymentStatusResponse.fromJson(String str) => PaymentStatusResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentStatusResponse.fromMap(Map<String, dynamic> json) => PaymentStatusResponse(
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
    required this.amount,
    required this.type,
    required this.code,
    required this.status,
    required this.message,
    required this.createdDt,
    required this.updatedDt,
    required this.transactionId,
    required this.paymentMethod,
    required this.userId,
  });

  final String amount;
  final dynamic type;
  final dynamic code;
  final String status;
  final dynamic message;
  final DateTime createdDt;
  final DateTime updatedDt;
  final String transactionId;
  final String paymentMethod;
  final int userId;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    amount: json["amount"],
    type: json["type"],
    code: json["code"],
    status: json["status"],
    message: json["message"],
    createdDt: DateTime.parse(json["created_dt"]),
    updatedDt: DateTime.parse(json["updated_dt"]),
    transactionId: json["transaction_id"],
    paymentMethod: json["payment_method"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "type": type,
    "code": code,
    "status": status,
    "message": message,
    "created_dt": createdDt.toIso8601String(),
    "updated_dt": updatedDt.toIso8601String(),
    "transaction_id": transactionId,
    "payment_method": paymentMethod,
    "user_id": userId,
  };
}
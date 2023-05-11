// To parse this JSON data, do
//
//     final walletsResponse = walletsResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class WalletsResponse {
  WalletsResponse({
    required this.message,
    required this.result,
  });

  final String message;
  final Result result;

  factory WalletsResponse.fromJson(String str) => WalletsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WalletsResponse.fromMap(Map<String, dynamic> json) => WalletsResponse(
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
    required this.code,
    required this.userId,
    required this.transactions,
    required this.recipientTransactions,
  });

  final String code;
  final int userId;
  final List<Transaction> transactions;
  final List<dynamic> recipientTransactions;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    code: json["code"],
    userId: json["user_id"],
    transactions: List<Transaction>.from(json["Transactions"].map((x) => Transaction.fromMap(x))),
    recipientTransactions: List<dynamic>.from(json["RecipientTransactions"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "user_id": userId,
    "Transactions": List<dynamic>.from(transactions.map((x) => x.toMap())),
    "RecipientTransactions": List<dynamic>.from(recipientTransactions.map((x) => x)),
  };
}

class Transaction {
  Transaction({
    required this.type,
    required this.amount,
    required this.walletId,
    required this.createdDt,
    required this.transactionId,
    required this.paymentMethod,
    required this.walletRecipientId,
    required this.paymentTransectionId,
  });

  final String type;
  final String amount;
  final int walletId;
  final DateTime createdDt;
  final String transactionId;
  final String paymentMethod;
  final dynamic walletRecipientId;
  final String paymentTransectionId;

  factory Transaction.fromJson(String str) => Transaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
    type: json["type"],
    amount: json["amount"],
    walletId: json["wallet_id"],
    createdDt: DateTime.parse(json["created_dt"]),
    transactionId: json["transaction_id"],
    paymentMethod: json["payment_method"],
    walletRecipientId: json["wallet_recipient_id"],
    paymentTransectionId: json["payment_transection_id"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "amount": amount,
    "wallet_id": walletId,
    "created_dt": createdDt.toIso8601String(),
    "transaction_id": transactionId,
    "payment_method": paymentMethod,
    "wallet_recipient_id": walletRecipientId,
    "payment_transection_id": paymentTransectionId,
  };
}

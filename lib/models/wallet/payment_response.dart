import 'dart:convert';
/// message : "success"
/// result : {"type":"TRANFER","amount":"-20","wallet_id":20,"created_dt":"2022-12-27T17:36:30.203Z","transaction_id":"OWN1672162589928","payment_method":"WALLET","wallet_recipient_id":21,"payment_transection_id":null}

PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));
String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());
class PaymentResponse {
  PaymentResponse({
      this.message, 
      this.result,});

  PaymentResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Payment.fromJson(json['result']) : null;
  }
  String? message;
  Payment? result;
PaymentResponse copyWith({  String? message,
  Payment? result,
}) => PaymentResponse(  message: message ?? this.message,
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

/// type : "TRANFER"
/// amount : "-20"
/// wallet_id : 20
/// created_dt : "2022-12-27T17:36:30.203Z"
/// transaction_id : "OWN1672162589928"
/// payment_method : "WALLET"
/// wallet_recipient_id : 21
/// payment_transection_id : null

Payment resultFromJson(String str) => Payment.fromJson(json.decode(str));
String resultToJson(Payment data) => json.encode(data.toJson());
class Payment {
  Payment({
      this.type, 
      this.amount, 
      this.walletId, 
      this.createdDt, 
      this.transactionId, 
      this.paymentMethod, 
      this.walletRecipientId, 
      this.paymentTransectionId,});

  Payment.fromJson(dynamic json) {
    type = json['type'];
    amount = json['amount'];
    walletId = json['wallet_id'];
    createdDt = json['created_dt'];
    transactionId = json['transaction_id'];
    paymentMethod = json['payment_method'];
    walletRecipientId = json['wallet_recipient_id'];
    paymentTransectionId = json['payment_transection_id'];
  }
  String? type;
  String? amount;
  num? walletId;
  String? createdDt;
  String? transactionId;
  String? paymentMethod;
  num? walletRecipientId;
  dynamic paymentTransectionId;
Payment copyWith({  String? type,
  String? amount,
  num? walletId,
  String? createdDt,
  String? transactionId,
  String? paymentMethod,
  num? walletRecipientId,
  dynamic paymentTransectionId,
}) => Payment(  type: type ?? this.type,
  amount: amount ?? this.amount,
  walletId: walletId ?? this.walletId,
  createdDt: createdDt ?? this.createdDt,
  transactionId: transactionId ?? this.transactionId,
  paymentMethod: paymentMethod ?? this.paymentMethod,
  walletRecipientId: walletRecipientId ?? this.walletRecipientId,
  paymentTransectionId: paymentTransectionId ?? this.paymentTransectionId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['amount'] = amount;
    map['wallet_id'] = walletId;
    map['created_dt'] = createdDt;
    map['transaction_id'] = transactionId;
    map['payment_method'] = paymentMethod;
    map['wallet_recipient_id'] = walletRecipientId;
    map['payment_transection_id'] = paymentTransectionId;
    return map;
  }

}
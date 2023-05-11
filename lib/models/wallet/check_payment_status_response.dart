import 'dart:convert';
/// message : "success"
/// result : {"amount":"1","type":null,"code":null,"status":"PENDING","message":null,"created_dt":"2023-01-02T19:15:25.382Z","updated_dt":"2023-01-02T19:15:25.383Z","transaction_id":"1672686924360","payment_method":"PROMTPAY","user_id":133}

CheckPaymentStatusResponse checkPaymentStatusResponseFromJson(String str) => CheckPaymentStatusResponse.fromJson(json.decode(str));
String checkPaymentStatusResponseToJson(CheckPaymentStatusResponse data) => json.encode(data.toJson());
class CheckPaymentStatusResponse {
  CheckPaymentStatusResponse({
      this.message, 
      this.result,});

  CheckPaymentStatusResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? PaymentStatus.fromJson(json['result']) : null;
  }
  String? message;
  PaymentStatus? result;
CheckPaymentStatusResponse copyWith({  String? message,
  PaymentStatus? result,
}) => CheckPaymentStatusResponse(  message: message ?? this.message,
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

/// amount : "1"
/// type : null
/// code : null
/// status : "PENDING"
/// message : null
/// created_dt : "2023-01-02T19:15:25.382Z"
/// updated_dt : "2023-01-02T19:15:25.383Z"
/// transaction_id : "1672686924360"
/// payment_method : "PROMTPAY"
/// user_id : 133

PaymentStatus resultFromJson(String str) => PaymentStatus.fromJson(json.decode(str));
String resultToJson(PaymentStatus data) => json.encode(data.toJson());
class PaymentStatus {
  PaymentStatus({
      this.amount, 
      this.type, 
      this.code, 
      this.status, 
      this.message, 
      this.createdDt, 
      this.updatedDt, 
      this.transactionId, 
      this.paymentMethod, 
      this.userId,});

  PaymentStatus.fromJson(dynamic json) {
    amount = json['amount'];
    type = json['type'];
    code = json['code'];
    status = json['status'];
    message = json['message'];
    createdDt = json['created_dt'];
    updatedDt = json['updated_dt'];
    transactionId = json['transaction_id'];
    paymentMethod = json['payment_method'];
    userId = json['user_id'];
  }
  String? amount;
  dynamic type;
  dynamic code;
  String? status;
  dynamic message;
  String? createdDt;
  String? updatedDt;
  String? transactionId;
  String? paymentMethod;
  num? userId;
PaymentStatus copyWith({  String? amount,
  dynamic type,
  dynamic code,
  String? status,
  dynamic message,
  String? createdDt,
  String? updatedDt,
  String? transactionId,
  String? paymentMethod,
  num? userId,
}) => PaymentStatus(  amount: amount ?? this.amount,
  type: type ?? this.type,
  code: code ?? this.code,
  status: status ?? this.status,
  message: message ?? this.message,
  createdDt: createdDt ?? this.createdDt,
  updatedDt: updatedDt ?? this.updatedDt,
  transactionId: transactionId ?? this.transactionId,
  paymentMethod: paymentMethod ?? this.paymentMethod,
  userId: userId ?? this.userId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['type'] = type;
    map['code'] = code;
    map['status'] = status;
    map['message'] = message;
    map['created_dt'] = createdDt;
    map['updated_dt'] = updatedDt;
    map['transaction_id'] = transactionId;
    map['payment_method'] = paymentMethod;
    map['user_id'] = userId;
    return map;
  }

}
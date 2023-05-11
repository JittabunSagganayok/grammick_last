import 'dart:convert';
/// message : "success"
/// result : ["CASH","WALLET","CREDIT"]

PaymentOptionResponse paymentOptionResponseFromJson(String str) => PaymentOptionResponse.fromJson(json.decode(str));
String paymentOptionResponseToJson(PaymentOptionResponse data) => json.encode(data.toJson());
class PaymentOptionResponse {
  PaymentOptionResponse({
      this.message, 
      this.result,});

  PaymentOptionResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? json['result'].cast<String>() : [];
  }
  String? message;
  List<String>? result;
PaymentOptionResponse copyWith({  String? message,
  List<String>? result,
}) => PaymentOptionResponse(  message: message ?? this.message,
  result: result ?? this.result,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['result'] = result;
    return map;
  }

}
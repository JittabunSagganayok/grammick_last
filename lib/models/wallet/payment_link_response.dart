import 'dart:convert';
/// message : "success"
/// result : {"payment_transection_id":"1672684335503","redirect_url":"https://gateway.ksher.com/ua?order_uuid=c863e3d28acb11edbc53525400962f26&lang=en","acquirer":"th_ksher"}

PaymentLinkResponse paymentLinkResponseFromJson(String str) => PaymentLinkResponse.fromJson(json.decode(str));
String paymentLinkResponseToJson(PaymentLinkResponse data) => json.encode(data.toJson());
class PaymentLinkResponse {
  PaymentLinkResponse({
      this.message, 
      this.result,});

  PaymentLinkResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? PaymentLink.fromJson(json['result']) : null;
  }
  String? message;
  PaymentLink? result;
PaymentLinkResponse copyWith({  String? message,
  PaymentLink? result,
}) => PaymentLinkResponse(  message: message ?? this.message,
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

/// payment_transection_id : "1672684335503"
/// redirect_url : "https://gateway.ksher.com/ua?order_uuid=c863e3d28acb11edbc53525400962f26&lang=en"
/// acquirer : "th_ksher"

PaymentLink resultFromJson(String str) => PaymentLink.fromJson(json.decode(str));
String resultToJson(PaymentLink data) => json.encode(data.toJson());
class PaymentLink {
  PaymentLink({
      this.paymentTransectionId, 
      this.redirectUrl, 
      this.acquirer,});

  PaymentLink.fromJson(dynamic json) {
    paymentTransectionId = json['payment_transection_id'];
    redirectUrl = json['redirect_url'];
    acquirer = json['acquirer'];
  }
  String? paymentTransectionId;
  String? redirectUrl;
  String? acquirer;
PaymentLink copyWith({  String? paymentTransectionId,
  String? redirectUrl,
  String? acquirer,
}) => PaymentLink(  paymentTransectionId: paymentTransectionId ?? this.paymentTransectionId,
  redirectUrl: redirectUrl ?? this.redirectUrl,
  acquirer: acquirer ?? this.acquirer,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_transection_id'] = paymentTransectionId;
    map['redirect_url'] = redirectUrl;
    map['acquirer'] = acquirer;
    return map;
  }

}
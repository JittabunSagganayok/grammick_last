import 'dart:convert';

/// message : "success"
/// result : {"userId":7}

VerifyOtpResponse verifyOtpResponseFromJson(String str) =>
    VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) =>
    json.encode(data.toJson());

class VerifyOtpResponse {
  VerifyOtpResponse({
    this.message,
    this.result,
  });

  VerifyOtpResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null
        ? VerifyOtpResult.fromJson(json['result'])
        : null;
  }

  String? message;
  VerifyOtpResult? result;

  VerifyOtpResponse copyWith({
    String? message,
    VerifyOtpResult? result,
  }) =>
      VerifyOtpResponse(
        message: message ?? this.message,
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

/// userId : 7

VerifyOtpResult resultFromJson(String str) =>
    VerifyOtpResult.fromJson(json.decode(str));

String resultToJson(VerifyOtpResult data) => json.encode(data.toJson());

class VerifyOtpResult {
  VerifyOtpResult({
    this.userId,
    this.ref,
    this.phone,
  });

  VerifyOtpResult.fromJson(dynamic json) {
    userId = json['userId'];
    ref = json['ref'];
    phone = json['phone'];
  }

  int? userId;
  String? ref;
  String? phone;

  VerifyOtpResult copyWith({
    int? userId,
  }) =>
      VerifyOtpResult(
        userId: userId ?? this.userId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    return map;
  }
}

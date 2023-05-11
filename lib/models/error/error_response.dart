import 'dart:convert';
/// message : "phone must be a phone number"

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));
String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());
class ErrorResponse {
  ErrorResponse({
      this.message,});

  ErrorResponse.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;
ErrorResponse copyWith({  String? message,
}) => ErrorResponse(  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}
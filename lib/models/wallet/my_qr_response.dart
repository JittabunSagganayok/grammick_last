import 'dart:convert';
/// result : 10

class MyQrResponse {
  MyQrResponse({
      this.result,});

  MyQrResponse.fromJson(dynamic json) {
    result = json['result'].toString().replaceAll('data:image/png;base64,', '');
  }
  String? result;
}
import 'dart:convert';
/// message : "success"
/// result : 0

MyWalletResponse myWalletResponseFromJson(String str) => MyWalletResponse.fromJson(json.decode(str));
String myWalletResponseToJson(MyWalletResponse data) => json.encode(data.toJson());
class MyWalletResponse {
  MyWalletResponse({
      this.message,
      this.result,
    }
  );

  MyWalletResponse.fromJson(dynamic json) {
    message = json['message'];
    result = double.tryParse(json['result']) ?? 0.0;
  }
  String? message;
  double? result;

  MyWalletResponse copyWith({  String? message,
    double? result,
  }) => MyWalletResponse(  message: message ?? this.message,
    result: result ?? this.result,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['result'] = result;
    return map;
  }

}
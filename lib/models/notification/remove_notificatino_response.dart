import 'dart:convert';
/// message : "success"
/// result : {"count":1}

RemoveNotificatinoResponse removeNotificatinoResponseFromJson(String str) => RemoveNotificatinoResponse.fromJson(json.decode(str));
String removeNotificatinoResponseToJson(RemoveNotificatinoResponse data) => json.encode(data.toJson());
class RemoveNotificatinoResponse {
  RemoveNotificatinoResponse({
      this.message, 
      this.result,});

  RemoveNotificatinoResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? message;
  Result? result;
RemoveNotificatinoResponse copyWith({  String? message,
  Result? result,
}) => RemoveNotificatinoResponse(  message: message ?? this.message,
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

/// count : 1

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      this.count,});

  Result.fromJson(dynamic json) {
    count = json['count'];
  }
  num? count;
Result copyWith({  num? count,
}) => Result(  count: count ?? this.count,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}
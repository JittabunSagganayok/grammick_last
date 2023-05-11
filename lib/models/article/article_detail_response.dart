import 'dart:convert';

import 'article_list_response.dart';

/// message : "success"
/// result : {"id":1,"title":"บทความ 12","picture":"dev/20a6550a-9750-4333-96e6-3001a6b35e14.jpeg","read_count":0,"created_dt":"2022-09-07T15:15:18.541Z","description":"คำอธิบาย บทความ 1"}

ArticleDetailResponse articleDetailResponseFromJson(String str) =>
    ArticleDetailResponse.fromJson(json.decode(str));

String articleDetailResponseToJson(ArticleDetailResponse data) =>
    json.encode(data.toJson());

class ArticleDetailResponse {
  ArticleDetailResponse({
    this.message,
    this.result,
  });

  ArticleDetailResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Article.fromJson(json['result']) : null;
  }

  String? message;
  Article? result;

  ArticleDetailResponse copyWith({
    String? message,
    Article? result,
  }) =>
      ArticleDetailResponse(
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

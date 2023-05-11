import 'dart:convert';
/// message : "success"
/// result : [{"id":1,"title":"บทความ 12","picture":"dev/20a6550a-9750-4333-96e6-3001a6b35e14.jpeg","read_count":0,"created_dt":"2022-09-07T15:15:18.541Z","description":"คำอธิบาย บทความ 1"}]

ArticlesListResponse articlesListResponseFromJson(String str) => ArticlesListResponse.fromJson(json.decode(str));
String articlesListResponseToJson(ArticlesListResponse data) => json.encode(data.toJson());
class ArticlesListResponse {
  ArticlesListResponse({
      this.message, 
      this.result,});

  ArticlesListResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Article.fromJson(v));
      });
    }
  }
  String? message;
  List<Article>? result;
ArticlesListResponse copyWith({  String? message,
  List<Article>? result,
}) => ArticlesListResponse(  message: message ?? this.message,
  result: result ?? this.result,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// title : "บทความ 12"
/// picture : "dev/20a6550a-9750-4333-96e6-3001a6b35e14.jpeg"
/// read_count : 0
/// created_dt : "2022-09-07T15:15:18.541Z"
/// description : "คำอธิบาย บทความ 1"

Article resultFromJson(String str) => Article.fromJson(json.decode(str));
String resultToJson(Article data) => json.encode(data.toJson());
class Article {
  Article({
      this.id, 
      this.title, 
      this.picture, 
      this.readCount, 
      this.createdDt, 
      this.description,});

  Article.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    picture = json['picture'];
    readCount = json['read_count'];
    createdDt = json['created_dt'];
    description = json['description'];
  }
  int? id;
  String? title;
  String? picture;
  int? readCount;
  String? createdDt;
  String? description;
Article copyWith({  int? id,
  String? title,
  String? picture,
  int? readCount,
  String? createdDt,
  String? description,
}) => Article(  id: id ?? this.id,
  title: title ?? this.title,
  picture: picture ?? this.picture,
  readCount: readCount ?? this.readCount,
  createdDt: createdDt ?? this.createdDt,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['picture'] = picture;
    map['read_count'] = readCount;
    map['created_dt'] = createdDt;
    map['description'] = description;
    return map;
  }

}
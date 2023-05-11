import 'dart:convert';
/// message : "success"
/// result : [{"id":1,"title":"Intorduction 1","picture":null,"description":"Description Intorduction 1"},{"id":2,"title":"Intorduction 2","picture":null,"description":"Description Intorduction 2"},{"id":3,"title":"Intorduction 3","picture":null,"description":"Description Intorduction 3"}]

IntroductionResponse introductionResponseFromJson(String str) => IntroductionResponse.fromJson(json.decode(str));
String introductionResponseToJson(IntroductionResponse data) => json.encode(data.toJson());
class IntroductionResponse {
  IntroductionResponse({
      this.message, 
      this.result,});

  IntroductionResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(IntroductionList.fromJson(v));
      });
    }
  }
  String? message;
  List<IntroductionList>? result;
IntroductionResponse copyWith({  String? message,
  List<IntroductionList>? result,
}) => IntroductionResponse(  message: message ?? this.message,
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
/// title : "Intorduction 1"
/// picture : null
/// description : "Description Intorduction 1"

IntroductionList resultFromJson(String str) => IntroductionList.fromJson(json.decode(str));
String resultToJson(IntroductionList data) => json.encode(data.toJson());
class IntroductionList {
  IntroductionList({
      this.id, 
      this.title, 
      this.picture, 
      this.description,});

  IntroductionList.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    picture = json['picture'];
    description = json['description'];
  }
  int? id;
  String? title;
  String? picture;
  String? description;
IntroductionList copyWith({  int? id,
  String? title,
  dynamic picture,
  String? description,
}) => IntroductionList(  id: id ?? this.id,
  title: title ?? this.title,
  picture: picture ?? this.picture,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['picture'] = picture;
    map['description'] = description;
    return map;
  }

}
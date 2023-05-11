
import 'dart:convert';

class TermCondResponse {
  TermCondResponse({
    required this.message,
    required this.termConditions,
    required this.count,
  });

  final String message;
  final List<TermCondition> termConditions;
  final int count;

  factory TermCondResponse.fromJson(String str) => TermCondResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TermCondResponse.fromMap(Map<String, dynamic> json) => TermCondResponse(
    message: json["message"],
    termConditions: List<TermCondition>.from(json["result"].map((x) => TermCondition.fromMap(x))),
    count: json["count"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "result": List<dynamic>.from(termConditions.map((x) => x.toMap())),
    "count": count,
  };
}

class TermCondition {
  TermCondition({
    required this.id,
    required this.title,
    required this.createdDt,
    required this.description,
  });

  final int id;
  final String title;
  final DateTime createdDt;
  final String description;

  factory TermCondition.fromJson(String str) => TermCondition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TermCondition.fromMap(Map<String, dynamic> json) => TermCondition(
    id: json["id"],
    title: json["title"],
    createdDt: DateTime.parse(json["created_dt"]),
    description: json["description"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "created_dt": createdDt.toIso8601String(),
    "description": description,
  };
}

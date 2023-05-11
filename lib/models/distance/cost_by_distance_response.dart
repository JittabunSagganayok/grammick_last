import 'dart:convert';
/// message : "success"
/// result : {"cost":157.59,"distance":13.259,"estime":{"hours":0,"minute":20}}

CostByDistanceResponse costByDistanceResponseFromJson(String str) => CostByDistanceResponse.fromJson(json.decode(str));
String costByDistanceResponseToJson(CostByDistanceResponse data) => json.encode(data.toJson());
class CostByDistanceResponse {
  CostByDistanceResponse({
      this.message, 
      this.result,});

  CostByDistanceResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? CostByDistance.fromJson(json['result']) : null;
  }
  String? message;
  CostByDistance? result;
CostByDistanceResponse copyWith({  String? message,
  CostByDistance? result,
}) => CostByDistanceResponse(  message: message ?? this.message,
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

/// cost : 157.59
/// distance : 13.259
/// estime : {"hours":0,"minute":20}

CostByDistance resultFromJson(String str) => CostByDistance.fromJson(json.decode(str));
String resultToJson(CostByDistance data) => json.encode(data.toJson());
class CostByDistance {
  CostByDistance({
      this.cost, 
      this.distance, 
      this.estime,});

  CostByDistance.fromJson(dynamic json) {
    cost = json['cost'];
    distance = json['distance'];
    estime = json['estime'] != null ? Estime.fromJson(json['estime']) : null;
  }
  num? cost;
  num? distance;
  Estime? estime;
CostByDistance copyWith({  num? cost,
  num? distance,
  Estime? estime,
}) => CostByDistance(  cost: cost ?? this.cost,
  distance: distance ?? this.distance,
  estime: estime ?? this.estime,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cost'] = cost;
    map['distance'] = distance;
    if (estime != null) {
      map['estime'] = estime?.toJson();
    }
    return map;
  }

}

/// hours : 0
/// minute : 20

Estime estimeFromJson(String str) => Estime.fromJson(json.decode(str));
String estimeToJson(Estime data) => json.encode(data.toJson());
class Estime {
  Estime({
      this.hours, 
      this.minute,});

  Estime.fromJson(dynamic json) {
    hours = json['hours'];
    minute = json['minute'];
  }
  num? hours;
  num? minute;
Estime copyWith({  num? hours,
  num? minute,
}) => Estime(  hours: hours ?? this.hours,
  minute: minute ?? this.minute,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hours'] = hours;
    map['minute'] = minute;
    return map;
  }

}
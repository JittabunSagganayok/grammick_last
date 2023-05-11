import '../../../feature/assistant/data/assistant_service_category_response.dart';
import '../we-ride/we_ride_activity_response.dart';

/// Assistant : {"note":null,"status":"ARRIVED","type":"ERRAND","category_id":null,"activity_id":683,"estimate_time":30,"cost":"25","estimate_price":"1000","recipient_name":"test","recipient_phone":"0801111111","additional_cost":null,"picture_complete":null,"address_id":912,"Lists":[{"assistant_item_id":683,"name":"test","piece":55,"price":null}],"Destination":{"id":912,"lat":13.969963,"lng":100.5172882,"name":"The plant","detail":"","address":"ถ. กรุงเทพฯ - ปทุมธานี, ต.บางขะแยง, อำเภอเมืองปทุมธานี ปทุมธานี 12000"},"Distance":{"km":41,"away_from_you":19,"time":{"hours":0,"minute":47}}}

class AssistantOrderResponse {
  AssistantOrderResponse({
    this.assistant,
  });

  AssistantOrderResponse.fromJson(dynamic json) {
    assistant = json['Assistant'] != null
        ? AssistantData.fromJson(json['Assistant'])
        : null;
  }

  AssistantData? assistant;
}

/// note : null
/// status : "ARRIVED"
/// type : "ERRAND"
/// category_id : null
/// activity_id : 683
/// estimate_time : 30
/// cost : "25"
/// estimate_price : "1000"
/// recipient_name : "test"
/// recipient_phone : "0801111111"
/// additional_cost : null
/// picture_complete : null
/// address_id : 912
/// Lists : [{"assistant_item_id":683,"name":"test","piece":55,"price":null}]
/// Destination : {"id":912,"lat":13.969963,"lng":100.5172882,"name":"The plant","detail":"","address":"ถ. กรุงเทพฯ - ปทุมธานี, ต.บางขะแยง, อำเภอเมืองปทุมธานี ปทุมธานี 12000"}
/// Distance : {"km":41,"away_from_you":19,"time":{"hours":0,"minute":47}}

class AssistantData {
  AssistantData({
    this.note,
    this.status,
    this.type,
    this.categoryId,
    this.activityId,
    this.estimateTime,
    this.cost,
    this.estimatePrice,
    this.recipientName,
    this.recipientPhone,
    this.additionalCost,
    this.pictureComplete,
    this.addressId,
    this.lists,
    this.destination,
    this.distance,
  });

  AssistantData.fromJson(dynamic json) {
    note = json['note'];
    status = json['status'];
    type = json['type'];
    categoryId = json['category_id'];
    activityId = json['activity_id'];
    estimateTime = json['estimate_time'];
    cost = json['cost'];
    estimatePrice = json['estimate_price'];
    recipientName = json['recipient_name'];
    recipientPhone = json['recipient_phone'];
    additionalCost = json['additional_cost'];
    pictureComplete = json['picture_complete'];
    addressId = json['address_id'];
    if (json['Lists'] != null) {
      lists = [];
      json['Lists'].forEach((v) {
        lists?.add(Lists.fromJson(v));
      });
    }
    destination = json['Destination'] != null
        ? Destination.fromJson(json['Destination'])
        : null;
    pictures = json['pictures'] != null ? json['pictures'].cast<String>() : [];
    serviceCategory = json['ServiceCategory'] != null
        ? ServiceCategory.fromJson(json['ServiceCategory'])
        : null;
    distance =
        json['Distance'] != null ? Distance.fromJson(json['Distance']) : null;
  }

  String? note;
  String? status;
  String? type;
  num? categoryId;
  num? activityId;
  num? estimateTime;
  String? cost;
  String? estimatePrice;
  String? recipientName;
  String? recipientPhone;
  String? additionalCost;
  dynamic pictureComplete;
  num? addressId;
  List<Lists>? lists;
  Destination? destination;
  Distance? distance;
  List<String>? pictures;
  ServiceCategory? serviceCategory;
}

/// assistant_item_id : 683
/// name : "test"
/// piece : 55
/// price : null

class Lists {
  Lists({
    this.assistantItemId,
    this.name,
    this.piece,
    this.price,
  });

  Lists.fromJson(dynamic json) {
    assistantItemId = json['assistant_item_id'];
    name = json['name'];
    piece = json['piece'];
    price = json['price'];
  }

  num? assistantItemId;
  String? name;
  num? piece;
  dynamic price;
}

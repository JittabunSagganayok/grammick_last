import 'dart:convert';
/// message : "success"
/// result : [{"id":1,"name":"Coupon","code":"182f55b39c0","active":true,"end_date":"2022-10-13T19:22:06.000Z","expiry_dt":null,"created_dt":"2022-08-31T19:22:52.744Z","start_date":"2022-09-29T19:22:03.000Z","usage_limit":1,"activity_type":"RIDE","discount_type":"FIXED","discount_value":"1","minimum_spend":null},{"id":2,"name":"gfffff","code":"182f9a7796c","active":true,"end_date":"2022-09-30T15:24:36.000Z","expiry_dt":null,"created_dt":"2022-09-01T15:24:38.642Z","start_date":"2022-09-29T15:24:34.000Z","usage_limit":1,"activity_type":"RIDE","discount_type":"FIXED","discount_value":"1","minimum_spend":null},{"id":3,"name":"ggggg","code":"182f9accef8","active":true,"end_date":"2022-09-30T15:30:26.000Z","expiry_dt":null,"created_dt":"2022-09-01T15:30:28.218Z","start_date":"2022-09-29T15:30:24.000Z","usage_limit":1,"activity_type":"RIDE","discount_type":"FIXED","discount_value":"1","minimum_spend":"4"}]

CouponListResponse couponListResponseFromJson(String str) => CouponListResponse.fromJson(json.decode(str));
String couponListResponseToJson(CouponListResponse data) => json.encode(data.toJson());
class CouponListResponse {
  CouponListResponse({
      this.message, 
      this.result,});

  CouponListResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Coupon.fromJson(v));
      });
    }
  }
  String? message;
  List<Coupon>? result;
CouponListResponse copyWith({  String? message,
  List<Coupon>? result,
}) => CouponListResponse(  message: message ?? this.message,
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
/// name : "Coupon"
/// code : "182f55b39c0"
/// active : true
/// end_date : "2022-10-13T19:22:06.000Z"
/// expiry_dt : null
/// created_dt : "2022-08-31T19:22:52.744Z"
/// start_date : "2022-09-29T19:22:03.000Z"
/// usage_limit : 1
/// activity_type : "RIDE"
/// discount_type : "FIXED"
/// discount_value : "1"
/// minimum_spend : null

Coupon resultFromJson(String str) => Coupon.fromJson(json.decode(str));
String resultToJson(Coupon data) => json.encode(data.toJson());
class Coupon {
  Coupon({
      this.id, 
      this.name, 
      this.code, 
      this.active, 
      this.endDate, 
      this.expiryDt, 
      this.createdDt, 
      this.startDate, 
      this.usageLimit, 
      this.activityType, 
      this.discountType, 
      this.discountValue, 
      this.minimumSpend,});

  Coupon.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    active = json['active'];
    endDate = json['end_date'];
    expiryDt = json['expiry_dt'];
    createdDt = json['created_dt'];
    startDate = json['start_date'];
    usageLimit = json['usage_limit'];
    activityType = json['activity_type'];
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    if(discountType?.toLowerCase() == 'FIXED'.toLowerCase()){
      discountUnit = '฿';
    }else{
      discountUnit = '%';
    }

    minimumSpend = json['minimum_spend'];
    picture = json['picture'];
    description = json['description'];
    customers = json['customers'] != null ? json['customers'].cast<num>() : [];
    isSaved = false;
  }
  int? id;
  String? name;
  String? code;
  bool? active;
  String? endDate;
  dynamic expiryDt;
  String? createdDt;
  String? startDate;
  int? usageLimit;
  String? activityType;
  String? discountType;
  String? discountValue;
  String? discountUnit;
  String? minimumSpend;
  String? picture;
  String? description;
  List<num>? customers;
  bool? isSaved = false;

Coupon copyWith({  int? id,
  String? name,
  String? code,
  bool? active,
  String? endDate,
  dynamic expiryDt,
  String? createdDt,
  String? startDate,
  int? usageLimit,
  String? activityType,
  String? discountType,
  String? discountValue,
  String? minimumSpend,
}) => Coupon(  id: id ?? this.id,
  name: name ?? this.name,
  code: code ?? this.code,
  active: active ?? this.active,
  endDate: endDate ?? this.endDate,
  expiryDt: expiryDt ?? this.expiryDt,
  createdDt: createdDt ?? this.createdDt,
  startDate: startDate ?? this.startDate,
  usageLimit: usageLimit ?? this.usageLimit,
  activityType: activityType ?? this.activityType,
  discountType: discountType ?? this.discountType,
  discountValue: discountValue ?? this.discountValue,
  minimumSpend: minimumSpend ?? this.minimumSpend,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['active'] = active;
    map['end_date'] = endDate;
    map['expiry_dt'] = expiryDt;
    map['created_dt'] = createdDt;
    map['start_date'] = startDate;
    map['usage_limit'] = usageLimit;
    map['activity_type'] = activityType;
    map['discount_type'] = discountType;
    map['discount_value'] = discountValue;
    map['minimum_spend'] = minimumSpend;
    return map;
  }

}
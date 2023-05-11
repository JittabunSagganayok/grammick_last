/// message : "success"
/// result : [{"id":1,"name":"คูปอง 1","code":"183fef130df","active":true,"picture":null,"end_date":"2022-10-29T09:06:00.000Z","expiry_dt":null,"created_dt":"2022-10-22T09:06:03.108Z","start_date":"2022-10-06T09:05:58.000Z","description":null,"usage_limit":10,"minimum_spend":null,"activity_type":"RIDE","discount_type":"FIXED","discount_value":"1","is_maximum_usage":false,"isExpired":true}]

class CouponResponse {
  CouponResponse({
    this.message,
    this.result,
  });

  CouponResponse.fromJson(dynamic json) {
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
}

/// id : 1
/// name : "คูปอง 1"
/// code : "183fef130df"
/// active : true
/// picture : null
/// end_date : "2022-10-29T09:06:00.000Z"
/// expiry_dt : null
/// created_dt : "2022-10-22T09:06:03.108Z"
/// start_date : "2022-10-06T09:05:58.000Z"
/// description : null
/// usage_limit : 10
/// minimum_spend : null
/// activity_type : "RIDE"
/// discount_type : "FIXED"
/// discount_value : "1"
/// is_maximum_usage : false
/// isExpired : true

class Coupon {
  Coupon({
    this.id,
    this.name,
    this.code,
    this.active,
    this.picture,
    this.endDate,
    this.expiryDt,
    this.createdDt,
    this.startDate,
    this.description,
    this.usageLimit,
    this.minimumSpend,
    this.activityType,
    this.discountType,
    this.discountValue,
    this.isMaximumUsage,
    this.isExpired,
  });

  Coupon.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    active = json['active'];
    picture = json['picture'];
    endDate = json['end_date'];
    expiryDt = json['expiry_dt'];
    createdDt = json['created_dt'];
    startDate = json['start_date'];
    description = json['description'];
    usageLimit = json['usage_limit'];
    minimumSpend = json['minimum_spend'];
    activityType = json['activity_type'];
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    isMaximumUsage = json['is_maximum_usage'];
    isExpired = json['isExpired'];
    selected = false;
  }

  num? id;
  String? name;
  String? code;
  bool? active;
  String? picture;
  String? endDate;
  String? expiryDt;
  String? createdDt;
  String? startDate;
  String? description;
  num? usageLimit;
  String? minimumSpend;
  String? activityType;
  String? discountType;
  String? discountValue;
  bool? isMaximumUsage;
  bool? isExpired;
  bool? selected;
}

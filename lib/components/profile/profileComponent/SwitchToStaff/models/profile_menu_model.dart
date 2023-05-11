class ProfileMenu {
  String? status;
  String? message;
  List<Data>? data;

  ProfileMenu({this.status, this.message, this.data});

  ProfileMenu.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? staffId;
  String? merchantImage;
  String? merchantName;

  Data({this.staffId, this.merchantImage, this.merchantName});

  Data.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];
    merchantImage = json['merchant_image'];
    merchantName = json['merchant_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['staff_id'] = staffId;
    data['merchant_image'] = merchantImage;
    data['merchant_name'] = merchantName;
    return data;
  }
}

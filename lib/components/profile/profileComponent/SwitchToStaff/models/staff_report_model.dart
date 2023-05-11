class StaffReport {
  String? status;
  String? message;
  Data? data;

  StaffReport({this.status, this.message, this.data});

  StaffReport.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? accountId;
  int? staffRoleId;
  String? name;
  String? profileName;
  String? phone;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? staffRoleTitle;
  String? date;
  String? clockIn;
  String? clockOut;

  Data(
      {this.id,
      this.accountId,
      this.staffRoleId,
      this.name,
      this.profileName,
      this.phone,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.staffRoleTitle,
      this.date,
      this.clockIn,
      this.clockOut});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['account_id'];
    staffRoleId = json['staff_role_id'];
    name = json['name'];
    profileName = json['profile_name'];
    phone = json['phone'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    staffRoleTitle = json['staff_role_title'];
    date = json['date'];
    clockIn = json['clock_in'];
    clockOut = json['clock_out'];
    // clockOut = "2023-05-08T11:34:00.000Z";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['account_id'] = accountId;
    data['staff_role_id'] = staffRoleId;
    data['name'] = name;
    data['profile_name'] = profileName;
    data['phone'] = phone;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['staff_role_title'] = staffRoleTitle;
    data['date'] = date;
    data['clock_in'] = clockIn;
    data['clock_out'] = clockOut;
    return data;
  }
}

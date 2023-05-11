//     "status": "Success",
//     "message": "Delete data success"

class AppResponse {
  String? status;
  String? message;

  AppResponse({this.status, this.message});

  AppResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

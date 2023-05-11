import 'dart:convert';

/// driverActivityUpdateLocationRoom : "room"

JoinedDriverRoomResponse driverJoinedActivityResponseFromJson(String str) =>
    JoinedDriverRoomResponse.fromJson(json.decode(str));

String driverJoinedActivityResponseToJson(JoinedDriverRoomResponse data) =>
    json.encode(data.toJson());

class JoinedDriverRoomResponse {
  JoinedDriverRoomResponse({
    this.driverLocationRoom,
  });

  JoinedDriverRoomResponse.fromJson(dynamic json) {
    driverLocationRoom = json['driverLocationRoom'];
  }

  String? driverLocationRoom;

  JoinedDriverRoomResponse copyWith({
    String? driverActivityUpdateLocationRoom,
  }) =>
      JoinedDriverRoomResponse(
        driverLocationRoom: driverActivityUpdateLocationRoom ??
            this.driverLocationRoom,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driverActivityUpdateLocationRoom'] = driverLocationRoom;
    return map;
  }
}

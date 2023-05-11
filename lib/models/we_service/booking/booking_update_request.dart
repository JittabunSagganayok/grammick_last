class BookingUpdateRequest {
  num? zoneId;
  num? tableId;
  String? reservationDate;
  num? people;
  String? paymentMethod;

  BookingUpdateRequest(
      {this.zoneId,
      this.tableId,
      this.reservationDate,
      this.people,
      this.paymentMethod});

  BookingUpdateRequest.fromJson(Map<String, dynamic> json) {
    zoneId = json['zone_id'];
    tableId = json['table_id'];
    reservationDate = json['reservation_date'];
    people = json['people'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['zone_id'] = zoneId;
    data['table_id'] = tableId;
    data['reservation_date'] = reservationDate;
    data['people'] = people;
    data['payment_method'] = paymentMethod;
    return data;
  }
}

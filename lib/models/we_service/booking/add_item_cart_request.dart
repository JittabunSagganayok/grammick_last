class AddItemCartRequest {
  int? userId;
  num? merchantId;
  int? itemId;
  int? quantity; // api update use
  String? note; // api update use
  List<ItemOptional>? itemOptional; // api update use

  AddItemCartRequest(
      {this.userId,
      this.merchantId,
      this.itemId,
      this.quantity,
      this.note,
      this.itemOptional});

  AddItemCartRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    merchantId = json['merchant_id'];
    itemId = json['item_id'];
    quantity = json['quantity'];
    note = json['note'];
    if (json['item_optional'] != null) {
      itemOptional = <ItemOptional>[];
      json['item_optional'].forEach((v) {
        itemOptional!.add(ItemOptional.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['merchant_id'] = merchantId;
    data['item_id'] = itemId;
    data['quantity'] = quantity;
    data['note'] = note;
    if (itemOptional != null) {
      data['item_optional'] = itemOptional!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemOptional {
  int? id;
  List<int>? optional;

  ItemOptional({this.id, this.optional});

  ItemOptional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    optional = json['optional'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['optional'] = optional;
    return data;
  }
}

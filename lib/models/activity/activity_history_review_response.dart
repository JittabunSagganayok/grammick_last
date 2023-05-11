/// Review : {"score":0,"comment":null,"activity_id":537}

class ActivityHistoryReviewResponse {
  ActivityHistoryReviewResponse({
      this.review,});

  ActivityHistoryReviewResponse.fromJson(dynamic json) {
    review = json['Review'] != null ? Review.fromJson(json['Review']) : null;
  }
  Review? review;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (review != null) {
      map['Review'] = review?.toJson();
    }
    return map;
  }

}

/// score : 0
/// comment : null
/// activity_id : 537

class Review {
  Review({
      this.score, 
      this.comment, 
      this.activityId,});

  Review.fromJson(dynamic json) {
    score = json['score'];
    comment = json['comment'];
    activityId = json['activity_id'];
  }
  num? score;
  String? comment;
  num? activityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['score'] = score;
    map['comment'] = comment;
    map['activity_id'] = activityId;
    return map;
  }

}
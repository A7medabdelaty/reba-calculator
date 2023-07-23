class ResultModel {
  static const String collectionName = 'results';
  String processId;
  String userName;
  String sapNumber;
  String riskLevel;
  int score;
  int dateTime;

  ResultModel(
    this.processId,
    this.userName,
    this.sapNumber,
    this.riskLevel,
    this.score,
    this.dateTime,
  );

  ResultModel.fromJson(Map<String, dynamic> json)
      : this(
          json['processId'],
          json['userName'],
          json['sapNumber'],
          json['riskLevel'],
          json['score'],
          json['date'],
        );

  Map<String, dynamic> toJson() {
    return {
      'processId': processId,
      'userName': userName,
      'sapNumber': sapNumber,
      'riskLevel': riskLevel,
      'score': score,
      'date': dateTime,
    };
  }
}

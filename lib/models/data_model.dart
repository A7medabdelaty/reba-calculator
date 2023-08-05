class DataModel {
  static String collectionName = 'data';

  int neckPoints;
  int trunkPoints;
  int legPoints;
  int elbowPoints;
  int shoulderPoints;
  int wristPoints;
  int loadValue;
  int gripValue;
  int activityValue;
  int date;

  DataModel(
    this.neckPoints,
    this.trunkPoints,
    this.legPoints,
    this.elbowPoints,
    this.shoulderPoints,
    this.wristPoints,
    this.loadValue,
    this.gripValue,
    this.activityValue,
    this.date,
  );

  DataModel.fromJson(Map<String, dynamic> json)
      : this(
          json['neckValue'],
          json['trunkValue'],
          json['legValue'],
          json['elbowValue'],
          json['shoulderValue'],
          json['wristValue'],
          json['loadValue'],
          json['gripValue'],
          json['activityValue'],
          json['date'],
        );

  Map<String, dynamic> toJson() {
    return {
      'neckValue': neckPoints,
      'trunkValue': trunkPoints,
      'legValue': legPoints,
      'elbowValue': elbowPoints,
      'shoulderValue': shoulderPoints,
      'wristValue': wristPoints,
      'loadValue': loadValue,
      'gripValue': gripValue,
      'activityValue': activityValue,
      'date': date,
    };
  }
}

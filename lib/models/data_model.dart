class DataModel {
  static String collectionName = 'data';

  int neckValue;
  int trunkValue;
  int legValue;
  int elbowValue;
  int shoulderValue;
  int wristValue;
  int loadValue;
  int gripValue;
  int activityValue;
  int date;

  DataModel(
    this.neckValue,
    this.trunkValue,
    this.legValue,
    this.elbowValue,
    this.shoulderValue,
    this.wristValue,
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
      'neckValue': neckValue,
      'trunkValue': trunkValue,
      'legValue': legValue,
      'elbowValue': elbowValue,
      'shoulderValue': shoulderValue,
      'wristValue': wristValue,
      'loadValue': loadValue,
      'gripValue': gripValue,
      'activityValue': activityValue,
      'date': date,
    };
  }
}

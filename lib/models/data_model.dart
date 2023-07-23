class DataModel {
  static String collectionName = 'data';

  int neckValue;
  bool twistedNeck;
  int trunkValue;
  bool twistedTrunk;
  int legValue;
  int legFlexion;
  int elbowValue;
  int shoulderValue;
  bool shoulderRaised;
  bool shoulderAbducted;
  int wristValue;
  bool wristUlnar;
  int loadValue;
  int gripValue;
  int activityValue;

  DataModel(
    this.neckValue,
    this.twistedNeck,
    this.trunkValue,
    this.twistedTrunk,
    this.legValue,
    this.legFlexion,
    this.elbowValue,
    this.shoulderValue,
    this.shoulderRaised,
    this.shoulderAbducted,
    this.wristValue,
    this.wristUlnar,
    this.loadValue,
    this.gripValue,
    this.activityValue,
  );

  DataModel.fromJson(Map<String, dynamic> json)
      : this(
          json['neckValue'],
          json['twistedNeck'],
          json['trunkValue'],
          json['twistedTrunk'],
          json['legValue'],
          json['legFlexion'],
          json['elbowValue'],
          json['shoulderValue'],
          json['shoulderRaised'],
          json['shoulderAbducted'],
          json['wristValue'],
          json['wristUlnar'],
          json['loadValue'],
          json['gripValue'],
          json['activityValue'],
        );

  Map<String, dynamic> toJson() {
    return {
      'neckValue': neckValue,
      'twistedNeck': twistedNeck,
      'trunkValue': trunkValue,
      'twistedTrunk': twistedTrunk,
      'legValue': legValue,
      'legFlexion': legFlexion,
      'elbowValue': elbowValue,
      'shoulderValue': shoulderValue,
      'shoulderRaised': shoulderRaised,
      'shoulderAbducted': shoulderAbducted,
      'wristValue': wristValue,
      'wristUlnar': wristUlnar,
      'loadValue': loadValue,
      'gripValue': gripValue,
      'activityValue': activityValue,
    };
  }
}

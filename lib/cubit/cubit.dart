import 'package:al_araby/cubit/cubit_states.dart';
import 'package:al_araby/models/data_model.dart';
import 'package:al_araby/models/result_model.dart';
import 'package:al_araby/utils/database_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
import '../utils/file_storage.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  final TextEditingController? userNameController = TextEditingController();

  final TextEditingController? sapNumberController = TextEditingController();

  final TextEditingController? processIDController = TextEditingController();

  String? neckRadio;
  String? trunkRadio;
  String? legRadio;
  String? legRadio2;
  String? elbowRadio;
  String? shoulderRadio;
  String? wristRadio;
  bool neckCheckBox = false;
  bool trunkCheckBox = false;
  bool shoulderCheckBox1 = false;
  bool shoulderCheckBox2 = false;
  bool wristCheckBox = false;
  int? loadDownValue;
  int? gripDownValue;
  int? activityDownValue;
  String? armGroup;

  void resetFormValues() {
    neckRadio = null;
    neckCheckBox = false;
    trunkRadio = null;
    trunkCheckBox = false;
    legRadio = null;
    legRadio2 = null;
    elbowRadio = null;
    shoulderRadio = null;
    shoulderCheckBox1 = false;
    shoulderCheckBox2 = false;
    wristRadio = null;
    wristCheckBox = false;

    loadDownValue = null;
    gripDownValue = null;
    activityDownValue = null;

    userNameController!.clear();
    sapNumberController!.clear();
    processIDController!.clear();
    emit(ResetFormValuesState());
  }

  int neckPoints = 0;
  int trunkPoints = 0;
  int legPoints = 0;

  List<List<int>> phaseOneTableOne = [
    [1, 2, 3, 4],
    [2, 3, 4, 5],
    [2, 4, 5, 6],
    [3, 5, 6, 7],
    [4, 6, 7, 8],
  ];
  List<List<int>> phaseOneTableTwo = [
    [1, 2, 3, 4],
    [3, 4, 5, 6],
    [4, 5, 6, 7],
    [5, 6, 7, 8],
    [6, 7, 8, 9],
  ];
  List<List<int>> phaseOneTableThree = [
    [3, 3, 5, 6],
    [4, 5, 6, 7],
    [5, 6, 7, 8],
    [6, 7, 8, 9],
    [7, 8, 9, 9],
  ];

  int? tableOneValue;

  int? phaseOneResult;

  void calculateREBA() {
    phaseOne();
    phaseTwo();
    getFinalResult();
  }

  void getNeckPoints() {
    neckPoints = 0;
    if (neckRadio == '1') {
      neckPoints += 1;
    } else {
      neckPoints += 2;
    }

    if (neckCheckBox) {
      neckPoints += 1;
    }
  }

  void getTrunkPoints() {
    trunkPoints = 0;

    if (trunkRadio == '1') {
      trunkPoints += 1;
    } else if (trunkRadio == '2' || trunkRadio == '3') {
      trunkPoints += 2;
    } else if (trunkRadio == '4' || trunkRadio == '5') {
      trunkPoints += 3;
    } else {
      trunkPoints += 4;
    }

    if (trunkCheckBox) {
      trunkPoints += 1;
    }
  }

  void getLegPoints() {
    legPoints = 0;
    if (legRadio == '1') {
      legPoints += 1;
    } else if (legRadio == '2') {
      legPoints += 2;
    }

    if (legRadio2 == '30') {
      legPoints += 1;
    } else if (legRadio2 == '60') {
      legPoints += 2;
    }
  }

  int getTableOneValue() {
    if (neckPoints == 1) {
      return phaseOneTableOne[trunkPoints - 1][legPoints - 1];
    } else if (neckPoints == 2) {
      return phaseOneTableTwo[trunkPoints - 1][legPoints - 1];
    } else {
      return phaseOneTableThree[trunkPoints - 1][legPoints - 1];
    }
  }

  void addLoadPoints() {
    if (loadDownValue == 1) {
      phaseOneResult = tableOneValue;
    } else if (loadDownValue == 2) {
      phaseOneResult = tableOneValue! + 1;
    } else if (loadDownValue == 3) {
      phaseOneResult = tableOneValue! + 2;
    }
  }

  void phaseOne() {
    getNeckPoints();
    getTrunkPoints();
    getLegPoints();
    tableOneValue = getTableOneValue();
    addLoadPoints();
  }

  int? tableTwoValue;
  int? phaseTwoResult;

  List<List<int>> phaseTwoTableOne = [
    [1, 2, 2],
    [1, 2, 3],
    [3, 4, 5],
    [4, 5, 5],
    [6, 7, 8],
    [7, 8, 8],
  ];
  List<List<int>> phaseTwoTableTwo = [
    [1, 2, 3],
    [2, 3, 4],
    [4, 5, 5],
    [5, 6, 7],
    [7, 8, 8],
    [8, 9, 9],
  ];

  int elbowPoints = 0;

  void getElbowPoints() {
    elbowPoints = 0;
    if (elbowRadio == '1') {
      elbowPoints += 1;
    } else if (elbowRadio == '2' || elbowRadio == '3') {
      elbowPoints += 2;
    }
  }

  int shoulderPoints = 0;

  void getShoulderPoints() {
    shoulderPoints = 0;
    if (shoulderRadio == '1') {
      shoulderPoints += 1;
    } else if (shoulderRadio == '2' || shoulderRadio == '3') {
      shoulderPoints += 2;
    } else if (shoulderRadio == '4') {
      shoulderPoints += 3;
    } else if (shoulderRadio == '5') {
      shoulderPoints += 4;
    }

    if (shoulderCheckBox1) {
      shoulderPoints += 1;
    }
    if (shoulderCheckBox2) {
      shoulderPoints += 1;
    }
  }

  int wristPoints = 0;

  void getWristPoints() {
    wristPoints = 0;
    if (wristRadio == '1') {
      wristPoints += 1;
    } else {
      wristPoints += 2;
    }
  }

  int getTableTwoValue() {
    if (elbowPoints == 1) {
      return phaseTwoTableOne[shoulderPoints - 1][wristPoints - 1];
    } else {
      return phaseTwoTableTwo[shoulderPoints - 1][wristPoints - 1];
    }
  }

  void addGripPoints() {
    if (gripDownValue == 1) {
      phaseTwoResult = tableTwoValue;
    } else if (gripDownValue == 2) {
      phaseTwoResult = tableTwoValue! + 1;
    } else if (gripDownValue == 3) {
      phaseTwoResult = tableTwoValue! + 2;
    } else {
      phaseTwoResult = tableTwoValue! + 3;
    }
  }

  void phaseTwo() {
    getElbowPoints();
    getShoulderPoints();
    getWristPoints();
    tableTwoValue = getTableTwoValue();
    addGripPoints();
  }

  List<List<int>> finalTable = [
    [1, 1, 1, 2, 3, 3, 4, 5, 6, 7, 7, 7],
    [1, 2, 2, 3, 4, 4, 5, 6, 6, 7, 7, 8],
    [2, 3, 3, 3, 4, 5, 6, 7, 7, 8, 8, 8],
    [3, 4, 4, 4, 5, 6, 7, 8, 8, 9, 9, 9],
    [4, 4, 4, 5, 6, 7, 8, 8, 9, 9, 9, 9],
    [6, 6, 6, 7, 8, 8, 9, 9, 10, 10, 10, 10],
    [7, 7, 7, 8, 9, 9, 9, 10, 10, 11, 11, 11],
    [8, 8, 8, 9, 10, 10, 10, 10, 10, 11, 11, 11],
    [9, 9, 9, 10, 10, 10, 11, 11, 11, 12, 12, 12],
    [10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 12],
    [11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12],
    [12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12],
  ];

  int getFinalTableValue() {
    return finalTable[phaseOneResult! - 1][phaseTwoResult! - 1];
  }

  int? finalScore;

  void addActivityPoints() {
    finalScore = getFinalTableValue();
    finalScore = finalScore! + activityDownValue!;
  }

  ResultModel? result;
  DataModel? resultData;

  void getFinalResult() {
    addActivityPoints();
    String riskLevel;
    if (finalScore == 1) {
      riskLevel = 'Negligible risk';
    } else if (finalScore! >= 2 && finalScore! <= 3) {
      riskLevel = 'Low risk';
    } else if (finalScore! >= 4 && finalScore! <= 7) {
      riskLevel = 'Medium risk';
    } else if (finalScore! >= 8 && finalScore! <= 10) {
      riskLevel = 'High risk';
    } else {
      riskLevel = 'Very high risk';
    }
    result = ResultModel(
      processIDController!.text,
      userNameController!.text,
      sapNumberController!.text,
      riskLevel,
      finalScore!,
      DateTime.now().millisecondsSinceEpoch,
    );

    resultData = DataModel(
      int.parse(neckRadio!),
      neckCheckBox,
      int.parse(trunkRadio!),
      trunkCheckBox,
      int.parse(legRadio!),
      int.parse(legRadio2 ?? 'normal'),
      int.parse(elbowRadio!),
      int.parse(shoulderRadio!),
      shoulderCheckBox1,
      shoulderCheckBox2,
      int.parse(wristRadio!),
      wristCheckBox,
      loadDownValue!,
      gripDownValue!,
      activityDownValue!,
    );
  }

  void onFormValidated() {
    calculateREBA();
  }

  List<ResultModel> resultsList = [];

  Future<void> getResultData() {
    emit(GetResultsWaitingState());
    return DatabaseUtils.getResultsData().then((value) {
      value.map((e) => resultsList.add(e));
      emit(GetResultsSuccessState());
    }).catchError((e) {
      emit(GetResultsErrorState());
    });
  }

  static List<DataModel>? dataList;

  Future<void> addResultsToFireBase() {
    emit(AddResultsWaitingState());
    return DatabaseUtils.addResultsData(result!).then((value) {
      emit(AddResultsSuccessState());
      addExcelDataToFirebase();
    }).catchError((e) {
      print(e.toString());
      emit(AddResultsErrorState());
    });
  }

  Future<void> addExcelDataToFirebase() {
    emit(AddExcelDataWaitingState());
    return DatabaseUtils.addData(resultData!).then((value) {
      emit(AddExcelDataSuccessState());
    }).catchError((e) {
      emit(AddExcelDataErrorState());
    });
  }

  Future<void> getExcelData() {
    dataList = [];
    emit(GetExcelDataWaitingState());
    return DatabaseUtils.getData().then((value) {
      dataList = value;
      emit(GetExcelDataSuccessState());
    }).catchError((e) {
      emit(GetExcelDataErrorState());
    });
  }

  static void saveToExcel(List<ResultModel> myList) {
    final xcel.Workbook workbook = xcel.Workbook();
    final xcel.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByIndex(1, 1).setText("User Name");
    sheet.getRangeByIndex(1, 2).setText("SAP Number");
    sheet.getRangeByIndex(1, 3).setText("Process ID");
    sheet.getRangeByIndex(1, 4).setText("Score");
    sheet.getRangeByIndex(1, 5).setText("Risk Level");
    sheet.getRangeByIndex(1, 6).setText("Time");

    sheet.getRangeByIndex(1, 7).setText("Neck");
    sheet.getRangeByIndex(1, 8).setText("Twisted Neck");
    sheet.getRangeByIndex(1, 9).setText("Trunk");
    sheet.getRangeByIndex(1, 10).setText("Twisted Trunk");
    sheet.getRangeByIndex(1, 11).setText("Leg");
    sheet.getRangeByIndex(1, 12).setText("Leg Flexion");
    sheet.getRangeByIndex(1, 13).setText("Elbow");
    sheet.getRangeByIndex(1, 14).setText("Shoulder");
    sheet.getRangeByIndex(1, 15).setText("Shoulder Raised");
    sheet.getRangeByIndex(1, 16).setText("Shoulder Abducted");
    sheet.getRangeByIndex(1, 17).setText("Wrist");
    sheet.getRangeByIndex(1, 18).setText("Wrist Ulnar");
    sheet.getRangeByIndex(1, 19).setText("Load");
    sheet.getRangeByIndex(1, 20).setText("Grip");
    sheet.getRangeByIndex(1, 21).setText("Activity");

    for (var i = 0; i < myList.length; i++) {
      final item = myList[i];
      sheet.getRangeByIndex(i + 2, 1).setText(item.userName);
      sheet.getRangeByIndex(i + 2, 2).setText(item.sapNumber);
      sheet.getRangeByIndex(i + 2, 3).setText(item.processId);
      sheet.getRangeByIndex(i + 2, 4).setText('${item.score}');
      sheet.getRangeByIndex(i + 2, 5).setText(item.riskLevel);
      sheet.getRangeByIndex(i + 2, 6).setText(
            DateFormat('MM/dd/yyyy, hh:mm a').format(
              DateTime.fromMillisecondsSinceEpoch(item.dateTime),
            ),
          );
    }

    print('////////////////');
    for (var i = 0; i < dataList!.length; i++) {
      print('***********');
      print(dataList);
      final item = dataList![i];
      sheet.getRangeByIndex(i + 2, 7).setNumber(item.neckValue.toDouble());
      sheet.getRangeByIndex(i + 2, 8).setText(item.twistedNeck.toString());
      sheet.getRangeByIndex(i + 2, 9).setNumber(item.trunkValue.toDouble());
      sheet.getRangeByIndex(i + 2, 10).setText(item.twistedTrunk.toString());
      sheet.getRangeByIndex(i + 2, 11).setNumber(item.legValue.toDouble());
      sheet.getRangeByIndex(i + 2, 12).setNumber(item.legFlexion.toDouble());
      sheet.getRangeByIndex(i + 2, 13).setNumber(item.elbowValue.toDouble());
      sheet.getRangeByIndex(i + 2, 14).setNumber(item.shoulderValue.toDouble());
      sheet.getRangeByIndex(i + 2, 15).setText(item.shoulderRaised.toString());
      sheet
          .getRangeByIndex(i + 2, 16)
          .setText(item.shoulderAbducted.toString());
      sheet.getRangeByIndex(i + 2, 17).setNumber(item.wristValue.toDouble());
      sheet.getRangeByIndex(i + 2, 18).setText(item.wristUlnar.toString());
      sheet.getRangeByIndex(i + 2, 19).setNumber(item.loadValue.toDouble());
      sheet.getRangeByIndex(i + 2, 20).setNumber(item.gripValue.toDouble());
      sheet.getRangeByIndex(i + 2, 21).setNumber(item.activityValue.toDouble());
    }

    final List<int> bytes = workbook.saveAsStream();

    FileStorage.writeCounter(bytes, "results.xlsx");
    workbook.dispose();
  }
}

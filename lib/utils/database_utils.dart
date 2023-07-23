import 'package:al_araby/models/data_model.dart';
import 'package:al_araby/models/result_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseUtils {
  static CollectionReference<ResultModel> getResultsCollection() {
    return FirebaseFirestore.instance
        .collection(ResultModel.collectionName)
        .withConverter<ResultModel>(
          fromFirestore: (snapshot, options) =>
              ResultModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static CollectionReference<DataModel> getDataCollection() {
    return FirebaseFirestore.instance
        .collection(DataModel.collectionName)
        .withConverter<DataModel>(
          fromFirestore: (snapshot, options) =>
              DataModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addResultsData(ResultModel data) {
    return getResultsCollection().doc().set(data);
  }

  static Future<List<ResultModel>> getResultsData() async {
    QuerySnapshot<ResultModel> resultData =
        await getResultsCollection().orderBy('date').get();
    return resultData.docs.map((e) => e.data()).toList();
  }

  static Future<void> addData(DataModel data) {
    return getDataCollection().doc().set(data);
  }

  static Future<List<DataModel>> getData() async {
    QuerySnapshot<DataModel> data =
        await getDataCollection().orderBy('date').get();
    return data.docs.map((e) {
      return e.data();
    }).toList();
  }
}

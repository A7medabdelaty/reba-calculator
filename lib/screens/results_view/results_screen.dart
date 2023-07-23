import 'package:al_araby/cubit/cubit.dart';
import 'package:al_araby/cubit/cubit_states.dart';
import 'package:al_araby/models/result_model.dart';
import 'package:al_araby/screens/results_view/widgets/result_list.dart';
import 'package:al_araby/utils/database_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final List<ResultModel> myList;

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AppCubit.saveToExcel(myList);
            },
            child: const Icon(Icons.save),
          ),
          body: FutureBuilder(
            future: DatabaseUtils.getResultsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData){
                  myList = snapshot.data!;
                return SafeArea(
                  child: ResultList(snapshot.data!),
                );
              } else {
                return const Center(
                  child: Text('No Results Yet'),
                );
              }
            },
          ),
        );
      },
    );
  }
}

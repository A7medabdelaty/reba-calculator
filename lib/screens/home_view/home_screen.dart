import 'package:al_araby/cubit/cubit.dart';
import 'package:al_araby/screens/home_view/widgets/activity_view.dart';
import 'package:al_araby/screens/home_view/widgets/elbow_view.dart';
import 'package:al_araby/screens/home_view/widgets/grip_view.dart';
import 'package:al_araby/screens/home_view/widgets/leg_view.dart';
import 'package:al_araby/screens/home_view/widgets/load_view.dart';
import 'package:al_araby/screens/home_view/widgets/shoulder_view.dart';
import 'package:al_araby/screens/home_view/widgets/validation_form.dart';
import 'package:al_araby/screens/home_view/widgets/wrist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit_states.dart';
import 'widgets/neck_view.dart';
import 'widgets/trunk_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  NeckView(cubit),
                  const Divider(thickness: 2),
                  TrunkView(cubit),
                  const Divider(thickness: 2),
                  LegView(cubit),
                  const Divider(
                    thickness: 2,
                    color: Colors.black54,
                  ),
                  ElbowView(cubit),
                  const Divider(thickness: 2),
                  ShoulderView(cubit),
                  const Divider(thickness: 2),
                  WristView(cubit),
                  const Divider(
                    thickness: 2,
                    color: Colors.black54,
                  ),
                  LoadView(cubit),
                  const SizedBox(
                    height: 10,
                  ),
                  GripView(cubit),
                  const SizedBox(
                    height: 10,
                  ),
                  ActivityView(cubit),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black54,
                  ),
                  ValidationForm(cubit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

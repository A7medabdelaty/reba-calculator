import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class ElbowView extends StatefulWidget {
  const ElbowView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<ElbowView> createState() => _ElbowViewState();
}

class _ElbowViewState extends State<ElbowView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "./assets/images/elbow_label.png",
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          const SizedBox(
            width: 20,
          ),
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    "./assets/images/elbow_1.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "1",
                      groupValue: widget.cubit.elbowRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.elbowRadio = value;
                        });
                      }),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Image.asset(
                    "./assets/images/elbow_2.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "2",
                      groupValue: widget.cubit.elbowRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.elbowRadio = value;
                        });
                      }),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Image.asset(
                    "./assets/images/elbow_3.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "3",
                      groupValue: widget.cubit.elbowRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.elbowRadio = value;
                        });
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

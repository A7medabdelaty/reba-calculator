import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class TrunkView extends StatefulWidget {
  const TrunkView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<TrunkView> createState() => _TrunkViewState();
}

class _TrunkViewState extends State<TrunkView> {
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
            "./assets/images/trunk_label.png",
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
                    "./assets/images/trunk_1.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "1",
                      groupValue: widget.cubit.trunkRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.trunkRadio = value;
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
                    "./assets/images/trunk_2.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "2",
                      groupValue: widget.cubit.trunkRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.trunkRadio = value;
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
                    "./assets/images/trunk_3.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "3",
                      groupValue: widget.cubit.trunkRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.trunkRadio = value;
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
                    "./assets/images/trunk_4.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "4",
                      groupValue: widget.cubit.trunkRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.trunkRadio = value;
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
                    "./assets/images/trunk_5.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "5",
                      groupValue: widget.cubit.trunkRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.trunkRadio = value;
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
                    "./assets/images/trunk_6.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "6",
                      groupValue: widget.cubit.trunkRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.trunkRadio = value;
                        });
                      }),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const Text(
                    'Twisted Or Bending',
                    style: TextStyle(fontSize: 16),
                  ),
                  Checkbox(
                      value: widget.cubit.trunkCheckBox,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.trunkCheckBox = value!;
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

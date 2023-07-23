import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class ShoulderView extends StatefulWidget {
  const ShoulderView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<ShoulderView> createState() => _ShoulderViewState();
}

class _ShoulderViewState extends State<ShoulderView> {
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
            "./assets/images/shoulder_label.png",
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
                    "./assets/images/shoulder_1.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "1",
                      groupValue: widget.cubit.shoulderRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.shoulderRadio = value;
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
                    "./assets/images/shoulder_2.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "2",
                      groupValue: widget.cubit.shoulderRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.shoulderRadio = value;
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
                    "./assets/images/shoulder_3.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "3",
                      groupValue: widget.cubit.shoulderRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.shoulderRadio = value;
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
                    "./assets/images/shoulder_4.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "4",
                      groupValue: widget.cubit.shoulderRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.shoulderRadio = value;
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
                    "./assets/images/shoulder_5.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "5",
                      groupValue: widget.cubit.shoulderRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.shoulderRadio = value;
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
                    'shoulder raised?',
                    style: TextStyle(fontSize: 16),
                  ),
                  Checkbox(
                      value: widget.cubit.shoulderCheckBox1,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.shoulderCheckBox1 = value!;
                        });
                      }),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  const Text(
                    'shoulder abducted?',
                    style: TextStyle(fontSize: 16),
                  ),
                  Checkbox(
                      value: widget.cubit.shoulderCheckBox2,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.shoulderCheckBox2 = value!;
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

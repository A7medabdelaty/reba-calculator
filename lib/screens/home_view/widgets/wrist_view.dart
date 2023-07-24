import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class WristView extends StatefulWidget {
  const WristView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<WristView> createState() => _WristViewState();
}

class _WristViewState extends State<WristView> {
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
            "./assets/images/wrist_label.png",
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
                    "./assets/images/wrist_1.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "1",
                      groupValue: widget.cubit.wristRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.wristRadio = value;
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
                    "./assets/images/wrist_2.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "2",
                      groupValue: widget.cubit.wristRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.wristRadio = value;
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
                    "./assets/images/wrist_3.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "3",
                      groupValue: widget.cubit.wristRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.wristRadio = value;
                        });
                      }),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    width: 140,
                    child: Text(
                      'انحراف فى الرسغ داخلى او خارجى؟',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Checkbox(
                      value: widget.cubit.wristCheckBox,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.wristCheckBox = value!;
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

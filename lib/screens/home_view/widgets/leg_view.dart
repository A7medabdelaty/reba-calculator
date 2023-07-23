import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class LegView extends StatefulWidget {
  const LegView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<LegView> createState() => _LegViewState();
}

class _LegViewState extends State<LegView> {
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
            "./assets/images/leg_label.png",
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
                    "./assets/images/leg_1.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "1",
                      groupValue: widget.cubit.legRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.legRadio = value;
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
                    "./assets/images/leg_2.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "2",
                      groupValue: widget.cubit.legRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.legRadio = value;
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
                    width: 150,
                    child: Text(
                      'Flexion is between 30 and 60',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Radio(
                    value: "30",
                    onChanged: (value) {
                      setState(() {
                        widget.cubit.legRadio2 = value;
                      });
                    },
                    groupValue: widget.cubit.legRadio2,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    width: 150,
                    child: Text(
                      'Flexion is greater than 60',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Radio(
                    value: "60",
                    onChanged: (value) {
                      setState(() {
                        widget.cubit.legRadio2 = value;
                      });
                    },
                    groupValue: widget.cubit.legRadio2,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

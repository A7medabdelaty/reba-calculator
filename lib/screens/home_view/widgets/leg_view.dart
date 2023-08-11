import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class LegView extends StatefulWidget {
  LegView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<LegView> createState() => _LegViewState();
}

class _LegViewState extends State<LegView> {
  bool toggleable = true;

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
                      'انثناء الركبه من الخلف بين زاوية 30 وزاوية 60؟',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Radio(
                    value: "30",
                    toggleable: toggleable,
                    onChanged: (value) {
                      setState(() {
                        if (widget.cubit.legRadio2 == value) {
                          widget.cubit.legRadio2 = null;
                          toggleable = false;
                        }
                        {
                          widget.cubit.legRadio2 = value;
                        }
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
                      'انثناء الركبه من الخلف أكبر من زاوية 60؟',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Radio(
                    toggleable: toggleable,
                    value: "60",
                    onChanged: (value) {
                      setState(() {
                        if (widget.cubit.legRadio2 == value) {
                          widget.cubit.legRadio2 = null;
                          toggleable = false;
                        }
                        {
                          widget.cubit.legRadio2 = value;
                        }
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

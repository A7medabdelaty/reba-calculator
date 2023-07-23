import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class NeckView extends StatefulWidget {
  const NeckView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<NeckView> createState() => _NeckViewState();
}

class _NeckViewState extends State<NeckView> {
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
            "./assets/images/neck_label.png",
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
                    "./assets/images/neck_1.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "1",
                      groupValue: widget.cubit.neckRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.neckRadio = value;
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
                    "./assets/images/neck_2.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "2",
                      groupValue: widget.cubit.neckRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.neckRadio = value;
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
                    "./assets/images/neck_3.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Radio(
                      value: "3",
                      groupValue: widget.cubit.neckRadio,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.neckRadio = value;
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
                      value: widget.cubit.neckCheckBox,
                      onChanged: (value) {
                        setState(() {
                          widget.cubit.neckCheckBox = value!;
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

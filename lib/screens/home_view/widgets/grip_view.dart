import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class GripView extends StatefulWidget {
  const GripView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<GripView> createState() => _GripViewState();
}

class _GripViewState extends State<GripView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'grip value',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: DropdownButton(
              isExpanded: true,
              style: const TextStyle(
                color: Colors.cyan,
                fontSize: 16,
              ),
              borderRadius: BorderRadius.circular(12),
              dropdownColor: Colors.white,
              alignment: Alignment.center,
              value: widget.cubit.gripDownValue,
              hint: const Text('choose'),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("hand hold is good with handles"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("hand hold is acceptable"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("hand hold is not acceptable but possible"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("hand hold is dangerous"),
                ),
              ],
              onChanged: (value) {
                widget.cubit.gripDownValue = value;
                setState(() {});
              }),
        ),
      ],
    );
  }
}

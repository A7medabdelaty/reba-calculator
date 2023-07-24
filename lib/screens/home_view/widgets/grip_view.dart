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
          'نوعية القبضة',
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
              hint: const Text('اختار'),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("قبضة جيدة"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("قبضة مقبولة"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("قبضة غير مقبولة"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("عدم التمكن من الإمساك بالاشياء"),
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

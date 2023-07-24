import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  const ActivityView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'التكرارية',
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
              value: widget.cubit.activityDownValue,
              hint: const Text('اختار'),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("الثبات على وضع معين لأكثر من دقيقة"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text(
                    "عمل متكرر متغير أكثر من 4 مرات لكل دقيقة",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text(
                    "عمل متحرك غير ثابت سريع",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              onChanged: (value) {
                widget.cubit.activityDownValue = value;
                setState(() {});
              }),
        ),
      ],
    );
  }
}

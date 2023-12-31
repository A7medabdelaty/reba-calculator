import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class LoadView extends StatefulWidget {
  const LoadView(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<LoadView> createState() => _LoadViewState();
}

class _LoadViewState extends State<LoadView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'load value',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: DropdownButton(
              style: const TextStyle(
                color: Colors.cyan,
                fontSize: 16,
              ),
              borderRadius: BorderRadius.circular(12),
              dropdownColor: Colors.white,
              alignment: Alignment.center,
              value: widget.cubit.loadDownValue,
              hint: const Text('choose'),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Load less than 5kg"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Load between 5kg and 10kg"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Load greater than 10kg"),
                ),
              ],
              onChanged: (value) {
                widget.cubit.loadDownValue = value;
                setState(() {});
              }),
        ),
      ],
    );
  }
}

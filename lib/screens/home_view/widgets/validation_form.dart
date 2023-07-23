import 'package:al_araby/cubit/cubit.dart';
import 'package:flutter/material.dart';

class ValidationForm extends StatefulWidget {
  const ValidationForm(this.cubit, {super.key});

  final AppCubit cubit;

  @override
  State<ValidationForm> createState() => _ValidationFormState();
}

class _ValidationFormState extends State<ValidationForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(fontSize: 18),
            controller: widget.cubit.userNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              label: Text("User Name"),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            style: const TextStyle(fontSize: 18),
            controller: widget.cubit.sapNumberController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              label: Text("SAP Number"),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: widget.cubit.processIDController,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              label: Text(
                "Process ID",
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xfff6bd3f)),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  ),
                  onPressed: () {
                    widget.cubit.resetFormValues();
                  },
                  child: const Text("Reset"),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff13c013)),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (widget.cubit.neckRadio != null &&
                          widget.cubit.trunkRadio != null &&
                          widget.cubit.legRadio != null &&
                          widget.cubit.elbowRadio != null &&
                          widget.cubit.shoulderRadio != null &&
                          widget.cubit.wristRadio != null) {
                        widget.cubit.onFormValidated();
                        _showMyDialog(widget.cubit);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Fill All Fields"),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("Calculate"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog(AppCubit cubit) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('REBA Calculated'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text('UserName: ${cubit.result?.userName}'),
                const SizedBox(
                  height: 15,
                ),
                Text('SAP Number: ${cubit.result?.sapNumber}'),
                const SizedBox(
                  height: 15,
                ),
                Text('Process ID: ${cubit.result?.processId}'),
                const SizedBox(
                  height: 15,
                ),
                Text('Score Points: ${cubit.result?.score}'),
                const SizedBox(
                  height: 15,
                ),
                Text('Risk Level: ${cubit.result?.riskLevel}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                cubit.addResultsToFireBase().then((value) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Success'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text('Results Was Saved Successfully'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            cubit.resetFormValues();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ],
        );
      },
    );
  }
}

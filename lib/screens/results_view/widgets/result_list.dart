import 'package:al_araby/models/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ResultList extends StatefulWidget {
  const ResultList(this.items, {super.key});

  final List<ResultModel> items;

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: DataTable(
        showBottomBorder: true,
        headingTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        columnSpacing: 25,
        columns: const [
          DataColumn(
            label: Expanded(
              child: Text(
                'User Name',
                maxLines: 2,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'SAP Number',
                maxLines: 2,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Process ID',
                maxLines: 2,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Score',
                maxLines: 2,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Risk Level',
                maxLines: 2,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Time',
                maxLines: 2,
              ),
            ),
          ),
        ],
        rows: widget.items
            .map(
              (e) => DataRow(
                cells: [
                  DataCell(
                    Text(
                      e.userName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  DataCell(
                    Text(e.sapNumber),
                  ),
                  DataCell(Text(e.processId)),
                  DataCell(Text('${e.score}')),
                  DataCell(Text(e.riskLevel)),
                  DataCell(
                    Text(
                      DateFormat('dd/MM/yyyy, hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(e.dateTime),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

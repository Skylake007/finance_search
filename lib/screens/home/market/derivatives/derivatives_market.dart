import 'package:finance_search/screens/data/data_cells.dart';
import 'package:flutter/material.dart';

class Derivatives extends StatefulWidget {
  const Derivatives({super.key});

  @override
  State<Derivatives> createState() => _DerivativesState();
}

class _DerivativesState extends State<Derivatives> {
  final List<String> _derivatives = [
    'Future Index',
    'Future Bond',
    'Derivatives',
  ];
  String _selectedDerivatives = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            DropdownButton<String>(
                icon: const Icon(
                  Icons.arrow_downward_sharp,
                  size: 16,
                ),
                hint: const Text('Select Derivatives'),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                value:
                    _selectedDerivatives.isEmpty ? null : _selectedDerivatives,
                items:
                    _derivatives.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (String? selectedItem) {
                  setState(() {
                    _selectedDerivatives = selectedItem ?? '';
                  });
                }),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Symbol')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('+/-')),
                DataColumn(label: Text('+/-%')),
                DataColumn(label: Text('TotalVol')),
              ],
              rows: rows,
            ),
          ),
        ))
      ],
    );
  }
}

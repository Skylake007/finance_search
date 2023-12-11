import 'package:finance_search/screens/data/data_cells.dart';
import 'package:flutter/material.dart';

class Industry extends StatefulWidget {
  const Industry({super.key});

  @override
  State<Industry> createState() => _IndustryState();
}

class _IndustryState extends State<Industry> {
  final List<String> _industries = [
    'Software & Services',
    'Technology Hardware & Equipment',
    'Semiconductor Equipment',
    'Pharmaceuticals',
    'Biotechnology',
    'Medical Devices & Supplies',
    'Banking',
    'Insurance',
    'Asset Management & Custody Banks',
    'Automobiles & Components',
    'Consumer Durables & Apparel',
    'Retailing',
  ];
  String _selectedIndustry = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            DropdownButton<String>(
                icon: const Icon(Icons.arrow_downward_sharp),
                hint: const Text('Select Industry'),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                value: _selectedIndustry.isEmpty ? null : _selectedIndustry,
                items:
                    _industries.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? selectedItem) {
                  setState(() {
                    _selectedIndustry = selectedItem ?? '';
                  });
                }),
          ],
        ),
        // InkWell(
        //   child: Row(children: [
        //     const Text("This is Stock Market"),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.arrow_drop_down_rounded,
        //       ),
        //     )
        //   ]),
        //   onTap: () {
        //     debugPrint("Tapped");
        //   },
        // ),
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

import 'package:finance_search/screens/data/data_cells.dart';
import 'package:flutter/material.dart';

class CoverWarrants extends StatefulWidget {
  const CoverWarrants({super.key});

  @override
  State<CoverWarrants> createState() => _CoverWarrantsState();
}

class _CoverWarrantsState extends State<CoverWarrants> {
  final List<String> _symbols = [
    'MNS',
    'MSG',
    'POW',
    'STB',
  ];

  final List<String> _issuers = [
    '1HSC',
    '2SSI',
    '3ACBS',
    '4PHS',
  ];
  String _selectedSymbols = '';
  String _selectedIssuers = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              DropdownButton<String>(
                  icon: const Icon(
                    Icons.arrow_downward_sharp,
                    size: 16,
                  ),
                  hint: const Text(
                    'Select Symbol',
                    style: TextStyle(fontSize: 14),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  value: _selectedSymbols.isEmpty ? null : _selectedSymbols,
                  items: _symbols.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (String? selectedItem) {
                    setState(() {
                      _selectedSymbols = selectedItem ?? '';
                    });
                  }),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              DropdownButton<String>(
                  icon: const Icon(
                    Icons.arrow_downward_sharp,
                    size: 16,
                  ),
                  hint: const Text(
                    'Select Issuer',
                    style: TextStyle(fontSize: 14),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  value: _selectedIssuers.isEmpty ? null : _selectedIssuers,
                  items: _issuers.map<DropdownMenuItem<String>>((String value) {
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
                      _selectedIssuers = selectedItem ?? '';
                    });
                  }),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              const InkWell(
                child: Row(children: [
                  Text(
                    'Choose date',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.date_range),
                ]),
              )
            ],
          ),
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

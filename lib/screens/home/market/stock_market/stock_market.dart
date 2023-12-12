import 'package:finance_search/screens/data/data_cells.dart';
import 'package:flutter/material.dart';

class StockMarket extends StatefulWidget {
  const StockMarket({super.key});

  @override
  State<StockMarket> createState() => _StockMarketState();
}

class _StockMarketState extends State<StockMarket> {
  final List<String> _indexes = ['VN30', 'HOSE', 'HNX', 'UPCOM'];
  String _selectedIndex = '';
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
                icon: const Icon(
                  Icons.arrow_downward_sharp,
                  size: 16,
                ),
                hint: const Text('Select index'),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                value: _selectedIndex.isEmpty ? null : _selectedIndex,
                items: _indexes.map<DropdownMenuItem<String>>((String value) {
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
                    _selectedIndex = selectedItem ?? '';
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

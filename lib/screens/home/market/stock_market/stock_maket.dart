import 'package:flutter/material.dart';

class StockMarket extends StatefulWidget {
  const StockMarket({super.key});

  @override
  State<StockMarket> createState() => _StockMarketState();
}

class _StockMarketState extends State<StockMarket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Row(children: [
            const Text("This is Stock Market"),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
              ),
            )
          ]),
          onTap: () {
            debugPrint("Tapped");
          },
        ),
        Expanded(
            child: Column(
          children: [
            SingleChildScrollView(
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
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text("data")),
                      DataCell(Text("111")),
                      DataCell(Text("333")),
                      DataCell(Text("532")),
                      DataCell(Text("334")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("data")),
                      DataCell(Text("111")),
                      DataCell(Text("333")),
                      DataCell(Text("532")),
                      DataCell(Text("334")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("data")),
                      DataCell(Text("111")),
                      DataCell(Text("333")),
                      DataCell(Text("532")),
                      DataCell(Text("334")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("data")),
                      DataCell(Text("111")),
                      DataCell(Text("333")),
                      DataCell(Text("532")),
                      DataCell(Text("334")),
                    ]),
                  ],
                ),
              ),
            )
          ],
        ))
      ],
    );
  }
}

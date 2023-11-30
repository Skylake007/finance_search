import 'package:finance_search/screens/home/market/stock_market/stock_maket.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_tab_view/infinite_scroll_tab_view.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  final List<String> categories = [
    'Stock Market',
    'Industry',
    'Index',
    'Cover Warrants',
    'EFT',
    'Top Stock'
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InfiniteScrollTabView(
          contentLength: categories.length,
          onTabTap: (index) {
            debugPrint('You tapped: $index');
          },
          tabBuilder: (index, isSelected) => Text(
                categories[index],
                style: TextStyle(
                    color: isSelected ? Colors.pink : Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
          pageBuilder: (context, index, _) {
            return const StockMarket();
          }),
    );
  }
}

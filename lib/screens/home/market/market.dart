import 'package:finance_search/screens/home/market/derivatives/derivatives_market.dart';
import 'package:finance_search/screens/home/market/index/index_market.dart';
import 'package:finance_search/screens/home/market/industry/industry_market.dart';
import 'package:finance_search/screens/home/market/stock_market/stock_market.dart';
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
    'Derivatives',
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
            if (index == 0) {
              return const StockMarket();
            } else if (index == 1) {
              return const Industry();
            } else if (index == 2) {
              return const Index();
            } else if (index == 3) {
              return const Derivatives();
            } else {
              return const Text('Error');
            }
          }),
    );
  }
}

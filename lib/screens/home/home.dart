import 'package:finance_search/screens/home/assets/assets.dart';
import 'package:finance_search/screens/home/cashtransfer/cash_transfer.dart';
import 'package:finance_search/screens/home/market/market.dart';
import 'package:finance_search/screens/home/trading/trading.dart';
import 'package:finance_search/screens/home/watchlist/watch_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    WatchList(),
    Market(),
    Trading(),
    Assets(),
    CashTransfer()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: , //man hinh ben trai
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //drawer
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search some thing',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 0.0),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //for setting
                    },
                    icon: const Icon(Icons.settings),
                  ),

                  //for content
                ],
              ),
            ),
          ),
          _screens[_currentIndex]
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Watch list'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Market'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Trading'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Assets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows), label: 'Cash Transfer'),
        ],
        backgroundColor: Colors.blueGrey[200],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.greenAccent,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

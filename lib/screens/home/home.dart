import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentInxde = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: , //man hinh ben trai
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //drawer
                    },
                    icon: Icon(Icons.menu),
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
          )
        ],
      ),
    );
  }
}

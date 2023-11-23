import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // final int x;
  // const Splash({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/bg.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'))),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              //"Finance, ${this.x}",
              'Finance',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
      ]),
    );
  }
}

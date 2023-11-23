import 'package:flutter/material.dart';

class CashTransfer extends StatefulWidget {
  const CashTransfer({super.key});

  @override
  State<CashTransfer> createState() => _CashTransferState();
}

class _CashTransferState extends State<CashTransfer> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cast Transfer'),
    );
  }
}

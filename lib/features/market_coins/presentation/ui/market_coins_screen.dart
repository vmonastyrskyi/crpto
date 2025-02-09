import 'package:flutter/material.dart';

class MarketCoinsScreen extends StatelessWidget {
  const MarketCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: const Text(
          'Market Coins Screen',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

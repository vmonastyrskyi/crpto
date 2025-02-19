import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('crpto'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.0,
            children: <Widget>[
              const Text('Market Screen', style: TextStyle(fontSize: 20.0)),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('coins');
                },
                child: const Text('Go to Coins Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:crpto/core/navigation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoinsExchangeScreen extends StatelessWidget {
  const CoinsExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('crpto'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.0,
            children: <Widget>[
              const Text('Coins Exchange Screen', style: TextStyle(fontSize: 20.0)),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(RouteNames.coinsManagement);
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

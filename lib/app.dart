import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

class CrptoApp extends StatelessWidget {
  const CrptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crpto',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _buildFlavorBanner(
        show: kDebugMode,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Home Page'),
          ),
        ),
      ),
    );
  }

  Widget _buildFlavorBanner({
    bool show = true,
    Widget? child,
  }) {
    return show
        ? Banner(
            message: F.name.toUpperCase(),
            location: BannerLocation.topStart,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 11.0,
              height: 1.0,
            ),
            color: Colors.green,
            child: child,
          )
        : Container(child: child);
  }
}

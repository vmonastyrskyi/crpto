import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.flavor = Flavor.dev;

  await F.init();

  runApp(
    ProviderScope(
      child: const CrptoApp(),
    ),
  );
}

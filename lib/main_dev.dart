import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/utils/crypto_utils.dart';
import 'flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.flavor = Flavor.dev;

  await F.init();
  await CryptoUtils.init();

  runApp(
    const ProviderScope(
      child: CrptoApp(),
    ),
  );
}

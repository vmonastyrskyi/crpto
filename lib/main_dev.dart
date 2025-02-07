import 'package:flutter/material.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.flavor = Flavor.dev;

  await F.init();

  runApp(const CrptoApp());
}

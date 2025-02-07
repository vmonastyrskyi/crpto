import 'package:flutter/material.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.flavor = Flavor.prod;

  await F.init();

  runApp(const CrptoApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/data/local/database/database.dart';
import 'core/data/local/local_storage/local_storage.dart';
import 'core/data/local/local_storage/local_storage_with_cache.dart';
import 'core/utils/crypto_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await CryptoUtils.init();

  await localStorageWithCache.init();
  await localStorage.init();

  await crptoDB.loadCache();

  runApp(const ProviderScope(child: CrptoApp()));
}

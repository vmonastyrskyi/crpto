import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

const String _logTag = 'FLAVORS';

enum Flavor { prod, dev }

class F {
  static Flavor? flavor;

  static String get name {
    if (F.flavor == Flavor.prod) {
      return 'prod';
    }

    return 'dev';
  }

  static Future<void> init() async {
    await _showPackageInfo();

    await _loadEnv();
  }

  static Future<void> _showPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    final appFlavor = flavor?.name;
    final appName = packageInfo.appName;
    final packageName = packageInfo.packageName;
    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    _log('init', 'Flavor: $appFlavor');
    _log('init', 'App Name: $appName');
    _log('init', 'Package Name: $packageName');
    _log('init', 'Version: $version');
    _log('init', 'Build Number: $buildNumber');
  }

  static Future<void> _loadEnv() async {
    if (F.flavor == Flavor.prod) {
      await dotenv.load(fileName: '.env');
    } else {
      await dotenv.load(fileName: '.env-dev');
    }
  }

  static void _log(String method, String message) {
    log(name: _logTag, '[$method] $message');
  }
}

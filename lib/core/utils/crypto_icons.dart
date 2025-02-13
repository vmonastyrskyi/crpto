import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final RegExp _cryptoIconNameRegex = RegExp(r'(?<=crypto_icons\/)[^.]+(?=\.svg)');

abstract final class CryptoIcons {
  static final List<String> _cryptoIconNames = [];

  static Future<void> init() async {
    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final cryptoIconPaths = assetManifest
        .listAssets()
        .where((path) => path.startsWith('assets/svgs/crypto_icons/'))
        .toList();

    _cryptoIconNames.addAll(
      cryptoIconPaths
          .map((path) => _cryptoIconNameRegex.firstMatch(path)?.group(0))
          .nonNulls
          .toList(),
    );

    debugPrint(_cryptoIconNames.toString());
  }

  static String getSvgVecPath(String iconName) {
    return 'assets/svgs_vec/crypto_icons/${iconName.toLowerCase()}.svg.vec';
  }

  static String getSvgPath(String iconName) {
    return 'assets/svgs/crypto_icons/${iconName.toLowerCase()}.svg';
  }

  static bool contains(String iconName) {
    return _cryptoIconNames.contains(iconName.toLowerCase());
  }
}

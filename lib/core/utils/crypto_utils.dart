import 'package:flutter/services.dart';

final class CryptoUtils {
  static final RegExp _iconNameRegex = RegExp(r'(?<=tokens/)[^.]+(?=\.svg)');

  static final Set<String> _iconNames = {};

  static Future<void> init() async {
    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);

    final tokenPaths = [
      ...assetManifest.listAssets().where(
        (path) => path.startsWith('assets/svgs/tokens/'),
      ),
    ];

    _iconNames.addAll(
      tokenPaths
          .map(
            (path) => _iconNameRegex.firstMatch(path)?.group(0)?.toLowerCase(),
          )
          .nonNulls,
    );
  }

  static String getSvgVecPath(String iconName) {
    return 'assets/svgs_vec/tokens/$iconName.svg.vec';
  }

  static String getSvgPath(String iconName) {
    return 'assets/svgs/tokens/$iconName.svg';
  }

  static bool isIconExists(String iconName) {
    return _iconNames.contains(iconName.toLowerCase());
  }
}

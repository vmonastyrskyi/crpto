import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class TokenIcon extends StatelessWidget {
  const TokenIcon({super.key, required this.token, this.size = 40.0});

  final String token;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: VectorGraphic(
        loader: AssetBytesLoader(CryptoUtils.getSvgVecPath(token)),
        width: size,
        height: size,
      ),
    );
  }
}

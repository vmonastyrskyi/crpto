import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class TokenIcon extends StatelessWidget {
  const TokenIcon({
    super.key,
    required this.token,
    this.width = 40.0,
    this.height = 40.0,
  });

  final String token;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: VectorGraphic(
        loader: AssetBytesLoader(CryptoUtils.getSvgVecPath(token)),
        width: width,
        height: height,
      ),
    );
  }
}

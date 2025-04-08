import 'package:cached_network_image/cached_network_image.dart';
import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class TokenIcon extends ConsumerWidget {
  const TokenIcon({super.key, required this.symbol, this.size = 40.0});

  final String symbol;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coinMetadata = ref.watch(coinMetadataProvider(symbol));

    if (CryptoUtils.isIconExists(coinMetadata.baseAsset)) {
      return ClipOval(
        child: VectorGraphic(
          loader: AssetBytesLoader(
            CryptoUtils.getSvgVecPath(coinMetadata.baseAsset),
          ),
          width: size,
          height: size,
        ),
      );
    }

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: coinMetadata.logo,
        width: size,
        height: size,
      ),
    );
  }
}

import 'package:crpto/shared/application/use_case/coin_metadata/get_coin_metadata.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_metadata.g.dart';

@riverpod
CoinMetadata coinMetadata(Ref ref, String symbol) {
  final getCoinMetadata = ref.watch(getCoinMetadataUseCaseProvider);

  return getCoinMetadata(symbol);
}

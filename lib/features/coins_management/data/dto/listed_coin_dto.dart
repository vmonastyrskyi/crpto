import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/shared/domain/model/enum/coin_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_dto.freezed.dart';
part 'generated/listed_coin_dto.g.dart';

@freezed
@JsonSerializable(createToJson: false)
class ListedCoinDTO with _$ListedCoinDTO {
  const ListedCoinDTO({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.status,
    required this.tickSize,
    required this.stepSize,
  });

  @override
  final String symbol;
  @override
  @JsonKey(name: 'baseAsset')
  final String baseAsset;
  @override
  @JsonKey(name: 'quoteAsset')
  final String quoteAsset;
  @override
  final CoinStatus status;
  @override
  @JsonKey(name: 'tickSize')
  final String tickSize;
  @override
  @JsonKey(name: 'stepSize')
  final String stepSize;

  factory ListedCoinDTO.fromJson(Map<String, dynamic> json) {
    final filtersJson =
        (json['filters'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];

    final priceFilterJson = filtersJson.firstWhere(
      (filterJson) => filterJson['filterType'] == 'PRICE_FILTER',
      orElse: () => {},
    );

    final lotSizeJson = filtersJson.firstWhere(
      (filterJson) => filterJson['filterType'] == 'LOT_SIZE',
      orElse: () => {},
    );

    return _$ListedCoinDTOFromJson({
      ...json,
      'tickSize': priceFilterJson['tickSize'] as String,
      'stepSize': lotSizeJson['stepSize'] as String,
    });
  }
}

extension ListedCoinDTOMapper on ListedCoinDTO {
  static ListedCoin toModel(ListedCoinDTO dto) {
    return ListedCoin(
      symbol: dto.symbol,
      baseAsset: dto.baseAsset,
      quoteAsset: dto.quoteAsset,
      status: dto.status,
      tickSize: dto.tickSize,
      stepSize: dto.stepSize,
    );
  }
}

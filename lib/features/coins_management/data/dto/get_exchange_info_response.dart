import 'package:crpto/features/coins_management/data/dto/listed_coin_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_exchange_info_response.freezed.dart';
part 'generated/get_exchange_info_response.g.dart';

@freezed
class GetExchangeInfoResponse with _$GetExchangeInfoResponse {
  factory GetExchangeInfoResponse({
    @JsonKey(name: 'symbols') required List<ListedCoinDTO> listedCoins,
  }) = _GetExchangeInfoResponse;

  factory GetExchangeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExchangeInfoResponseFromJson(json);
}

import 'package:crpto/features/coins_management/data/dto/listed_coin_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_exchange_info_response.freezed.dart';
part 'generated/get_exchange_info_response.g.dart';

@freezed
@JsonSerializable(createToJson: false)
class GetExchangeInfoResponse with _$GetExchangeInfoResponse {
  const GetExchangeInfoResponse({required this.listedCoins});

  @override
  @JsonKey(name: 'symbols')
  final List<ListedCoinDTO> listedCoins;

  factory GetExchangeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExchangeInfoResponseFromJson(json);
}

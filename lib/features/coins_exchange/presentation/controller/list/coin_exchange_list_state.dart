import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_list_state.freezed.dart';

@freezed
class CoinExchangeListState with _$CoinExchangeListState {
  const CoinExchangeListState._({required this.coinsExchangeStats});

  const CoinExchangeListState.initial() : this._(coinsExchangeStats: const []);

  const CoinExchangeListState.data(List<CoinExchangeStats> coinsExchangeStats)
    : this._(coinsExchangeStats: coinsExchangeStats);

  const CoinExchangeListState.empty() : this._(coinsExchangeStats: const []);

  @override
  final List<CoinExchangeStats> coinsExchangeStats;
}

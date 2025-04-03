import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/features/coins_management/data/dto/listed_coin_dto.dart';
import 'package:crpto/features/coins_management/data/source/i_coin_data_source.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/binance_coin_data_source.g.dart';

@riverpod
final class BinanceCoinDataSource extends _$BinanceCoinDataSource
    implements ICoinDataSource {
  late Dio _dio;

  @override
  ICoinDataSource build() {
    final dioUrl = 'https://api.binance.com/api/v3';

    _dio = ref.watch(dioClientProvider(baseUrl: dioUrl));

    return this;
  }

  @override
  Future<List<ListedCoinDTO>> getListedCoins() async {
    const url = '/exchangeInfo';

    final response = await _dio.get(url);

    final listedCoinDTOs =
        List<dynamic>.from(
          response.data['symbols'],
        ).map((json) => ListedCoinDTO.fromJson(json)).toList();

    return listedCoinDTOs;
  }
}

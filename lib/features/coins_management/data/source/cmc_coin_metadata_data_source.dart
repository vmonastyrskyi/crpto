import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/features/coins_management/data/dto/cmc_coin_id_dto.dart';
import 'package:crpto/features/coins_management/data/dto/cmc_coin_metadata_dto.dart';
import 'package:crpto/features/coins_management/data/source/i_coin_metadata_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/cmc_coin_metadata_data_source.g.dart';

@riverpod
final class CmcCoinMetadataDataSource extends _$CmcCoinMetadataDataSource
    implements ICoinMetadataDataSource {
  late Dio _dio;

  @override
  ICoinMetadataDataSource build() {
    final dioUrl = 'https://pro-api.coinmarketcap.com';

    _dio = ref.watch(dioClientProvider(baseUrl: dioUrl))
      ..options.headers['X-CMC_PRO_API_KEY'] = dotenv.env['CMC_PRO_API_KEY'];

    return this;
  }

  @override
  Future<Map<String, CmcCoinMetadataDTO>> getCoinsMetadata(
    Set<String> baseAssets,
  ) async {
    const url = '/v2/cryptocurrency/info';

    final queryParameters = <String, dynamic>{
      if (baseAssets.isNotEmpty) 'symbol': baseAssets.join(','),
      'aux': 'logo,description,date_added',
      'skip_invalid': true,
    };

    final response = await _dio.get(queryParameters: queryParameters, url);

    final jsonData = Map<String, dynamic>.from(response.data['data']);

    final cmcCoinMetadataDTOMap = <String, CmcCoinMetadataDTO>{};

    for (final jsonEntry in jsonData.entries) {
      final jsonList = List<dynamic>.from(jsonEntry.value);

      if (jsonList.isEmpty) continue;

      final baseAsset = jsonEntry.key;

      if (!baseAssets.contains(baseAsset)) continue;

      final jsonLogo = jsonList[0]['logo'] as String;

      jsonList[0]['logo'] = jsonLogo.replaceAll('/64x64/', '/128x128/');

      final cmcCoinMetadataDTO = CmcCoinMetadataDTO.fromJson(jsonList[0]);

      cmcCoinMetadataDTOMap[baseAsset] ??= cmcCoinMetadataDTO;
    }

    return cmcCoinMetadataDTOMap;
  }

  @override
  Future<Map<String, CmcCoinIdDTO>> getCoinsId(Set<String> baseAssets) async {
    const url = '/v1/cryptocurrency/map';

    final queryParameters = <String, dynamic>{
      if (baseAssets.isNotEmpty) 'symbol': baseAssets.join(','),
      'sort': 'cmc_rank',
      'aux': '',
    };

    final response = await _dio.get(queryParameters: queryParameters, url);

    final jsonData = List<dynamic>.from(response.data['data']);

    final cmcCoinIdDTOMap = <String, CmcCoinIdDTO>{};

    for (final json in jsonData) {
      final cmcCoinIdDTO = CmcCoinIdDTO.fromJson(json);

      final baseAsset = cmcCoinIdDTO.baseAsset;

      if (!baseAssets.contains(baseAsset)) continue;

      cmcCoinIdDTOMap[baseAsset] ??= cmcCoinIdDTO;
    }

    return cmcCoinIdDTOMap;
  }
}

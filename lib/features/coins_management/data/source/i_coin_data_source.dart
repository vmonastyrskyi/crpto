import 'package:crpto/features/coins_management/data/dto/get_exchange_info_response.dart';

abstract interface class ICoinDataSource {
  Future<GetExchangeInfoResponse> getExchangeInfo();
}

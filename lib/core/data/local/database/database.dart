import 'package:crpto/shared/domain/model/enum/coin_category.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/coin_metadata.dart';
import 'tables/selected_coins.dart';

part 'generated/database.g.dart';

final CrptoDB crptoDB = CrptoDB.defaults();

@DriftDatabase(tables: [SelectedCoins, CoinsMetadata])
final class CrptoDB extends _$CrptoDB {
  CrptoDB.defaults() : super(driftDatabase(name: 'crpto_db'));

  @override
  int get schemaVersion => 1;

  Future<void> loadCache() async {
    await coinsMetadata.loadCache();
    await selectedCoins.loadCache();
  }
}

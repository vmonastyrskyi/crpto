// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../database.dart';

// ignore_for_file: type=lint
class $SelectedCoinsTable extends SelectedCoins
    with TableInfo<$SelectedCoinsTable, SelectedCoinDTO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SelectedCoinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [symbol];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'selected_coins';
  @override
  VerificationContext validateIntegrity(
    Insertable<SelectedCoinDTO> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {symbol};
  @override
  SelectedCoinDTO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SelectedCoinDTO(
      symbol:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}symbol'],
          )!,
    );
  }

  @override
  $SelectedCoinsTable createAlias(String alias) {
    return $SelectedCoinsTable(attachedDatabase, alias);
  }
}

class SelectedCoinDTO extends DataClass implements Insertable<SelectedCoinDTO> {
  final String symbol;
  const SelectedCoinDTO({required this.symbol});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['symbol'] = Variable<String>(symbol);
    return map;
  }

  SelectedCoinsCompanion toCompanion(bool nullToAbsent) {
    return SelectedCoinsCompanion(symbol: Value(symbol));
  }

  factory SelectedCoinDTO.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SelectedCoinDTO(symbol: serializer.fromJson<String>(json['symbol']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'symbol': serializer.toJson<String>(symbol)};
  }

  SelectedCoinDTO copyWith({String? symbol}) =>
      SelectedCoinDTO(symbol: symbol ?? this.symbol);
  SelectedCoinDTO copyWithCompanion(SelectedCoinsCompanion data) {
    return SelectedCoinDTO(
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SelectedCoinDTO(')
          ..write('symbol: $symbol')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => symbol.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectedCoinDTO && other.symbol == this.symbol);
}

class SelectedCoinsCompanion extends UpdateCompanion<SelectedCoinDTO> {
  final Value<String> symbol;
  final Value<int> rowid;
  const SelectedCoinsCompanion({
    this.symbol = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SelectedCoinsCompanion.insert({
    required String symbol,
    this.rowid = const Value.absent(),
  }) : symbol = Value(symbol);
  static Insertable<SelectedCoinDTO> custom({
    Expression<String>? symbol,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SelectedCoinsCompanion copyWith({Value<String>? symbol, Value<int>? rowid}) {
    return SelectedCoinsCompanion(
      symbol: symbol ?? this.symbol,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SelectedCoinsCompanion(')
          ..write('symbol: $symbol, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CoinsMetadataTable extends CoinsMetadata
    with TableInfo<$CoinsMetadataTable, CoinMetadataDTO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoinsMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseAssetMeta = const VerificationMeta(
    'baseAsset',
  );
  @override
  late final GeneratedColumn<String> baseAsset = GeneratedColumn<String>(
    'base_asset',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quoteAssetMeta = const VerificationMeta(
    'quoteAsset',
  );
  @override
  late final GeneratedColumn<String> quoteAsset = GeneratedColumn<String>(
    'quote_asset',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  relatedSymbols = GeneratedColumn<String>(
    'related_symbols',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<String>>($CoinsMetadataTable.$converterrelatedSymbols);
  @override
  List<GeneratedColumn> get $columns => [
    symbol,
    baseAsset,
    quoteAsset,
    displayName,
    status,
    relatedSymbols,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coins_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<CoinMetadataDTO> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('base_asset')) {
      context.handle(
        _baseAssetMeta,
        baseAsset.isAcceptableOrUnknown(data['base_asset']!, _baseAssetMeta),
      );
    } else if (isInserting) {
      context.missing(_baseAssetMeta);
    }
    if (data.containsKey('quote_asset')) {
      context.handle(
        _quoteAssetMeta,
        quoteAsset.isAcceptableOrUnknown(data['quote_asset']!, _quoteAssetMeta),
      );
    } else if (isInserting) {
      context.missing(_quoteAssetMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {symbol};
  @override
  CoinMetadataDTO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoinMetadataDTO(
      symbol:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}symbol'],
          )!,
      baseAsset:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}base_asset'],
          )!,
      quoteAsset:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}quote_asset'],
          )!,
      displayName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}display_name'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      relatedSymbols: $CoinsMetadataTable.$converterrelatedSymbols.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}related_symbols'],
        )!,
      ),
    );
  }

  @override
  $CoinsMetadataTable createAlias(String alias) {
    return $CoinsMetadataTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterrelatedSymbols =
      StringListConverter();
}

class CoinMetadataDTO extends DataClass implements Insertable<CoinMetadataDTO> {
  final String symbol;
  final String baseAsset;
  final String quoteAsset;
  final String displayName;
  final String status;
  final List<String> relatedSymbols;
  const CoinMetadataDTO({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.displayName,
    required this.status,
    required this.relatedSymbols,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['symbol'] = Variable<String>(symbol);
    map['base_asset'] = Variable<String>(baseAsset);
    map['quote_asset'] = Variable<String>(quoteAsset);
    map['display_name'] = Variable<String>(displayName);
    map['status'] = Variable<String>(status);
    {
      map['related_symbols'] = Variable<String>(
        $CoinsMetadataTable.$converterrelatedSymbols.toSql(relatedSymbols),
      );
    }
    return map;
  }

  CoinsMetadataCompanion toCompanion(bool nullToAbsent) {
    return CoinsMetadataCompanion(
      symbol: Value(symbol),
      baseAsset: Value(baseAsset),
      quoteAsset: Value(quoteAsset),
      displayName: Value(displayName),
      status: Value(status),
      relatedSymbols: Value(relatedSymbols),
    );
  }

  factory CoinMetadataDTO.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoinMetadataDTO(
      symbol: serializer.fromJson<String>(json['symbol']),
      baseAsset: serializer.fromJson<String>(json['baseAsset']),
      quoteAsset: serializer.fromJson<String>(json['quoteAsset']),
      displayName: serializer.fromJson<String>(json['displayName']),
      status: serializer.fromJson<String>(json['status']),
      relatedSymbols: serializer.fromJson<List<String>>(json['relatedSymbols']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'baseAsset': serializer.toJson<String>(baseAsset),
      'quoteAsset': serializer.toJson<String>(quoteAsset),
      'displayName': serializer.toJson<String>(displayName),
      'status': serializer.toJson<String>(status),
      'relatedSymbols': serializer.toJson<List<String>>(relatedSymbols),
    };
  }

  CoinMetadataDTO copyWith({
    String? symbol,
    String? baseAsset,
    String? quoteAsset,
    String? displayName,
    String? status,
    List<String>? relatedSymbols,
  }) => CoinMetadataDTO(
    symbol: symbol ?? this.symbol,
    baseAsset: baseAsset ?? this.baseAsset,
    quoteAsset: quoteAsset ?? this.quoteAsset,
    displayName: displayName ?? this.displayName,
    status: status ?? this.status,
    relatedSymbols: relatedSymbols ?? this.relatedSymbols,
  );
  CoinMetadataDTO copyWithCompanion(CoinsMetadataCompanion data) {
    return CoinMetadataDTO(
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      baseAsset: data.baseAsset.present ? data.baseAsset.value : this.baseAsset,
      quoteAsset:
          data.quoteAsset.present ? data.quoteAsset.value : this.quoteAsset,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      status: data.status.present ? data.status.value : this.status,
      relatedSymbols:
          data.relatedSymbols.present
              ? data.relatedSymbols.value
              : this.relatedSymbols,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoinMetadataDTO(')
          ..write('symbol: $symbol, ')
          ..write('baseAsset: $baseAsset, ')
          ..write('quoteAsset: $quoteAsset, ')
          ..write('displayName: $displayName, ')
          ..write('status: $status, ')
          ..write('relatedSymbols: $relatedSymbols')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    symbol,
    baseAsset,
    quoteAsset,
    displayName,
    status,
    relatedSymbols,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoinMetadataDTO &&
          other.symbol == this.symbol &&
          other.baseAsset == this.baseAsset &&
          other.quoteAsset == this.quoteAsset &&
          other.displayName == this.displayName &&
          other.status == this.status &&
          other.relatedSymbols == this.relatedSymbols);
}

class CoinsMetadataCompanion extends UpdateCompanion<CoinMetadataDTO> {
  final Value<String> symbol;
  final Value<String> baseAsset;
  final Value<String> quoteAsset;
  final Value<String> displayName;
  final Value<String> status;
  final Value<List<String>> relatedSymbols;
  final Value<int> rowid;
  const CoinsMetadataCompanion({
    this.symbol = const Value.absent(),
    this.baseAsset = const Value.absent(),
    this.quoteAsset = const Value.absent(),
    this.displayName = const Value.absent(),
    this.status = const Value.absent(),
    this.relatedSymbols = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CoinsMetadataCompanion.insert({
    required String symbol,
    required String baseAsset,
    required String quoteAsset,
    required String displayName,
    required String status,
    required List<String> relatedSymbols,
    this.rowid = const Value.absent(),
  }) : symbol = Value(symbol),
       baseAsset = Value(baseAsset),
       quoteAsset = Value(quoteAsset),
       displayName = Value(displayName),
       status = Value(status),
       relatedSymbols = Value(relatedSymbols);
  static Insertable<CoinMetadataDTO> custom({
    Expression<String>? symbol,
    Expression<String>? baseAsset,
    Expression<String>? quoteAsset,
    Expression<String>? displayName,
    Expression<String>? status,
    Expression<String>? relatedSymbols,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (baseAsset != null) 'base_asset': baseAsset,
      if (quoteAsset != null) 'quote_asset': quoteAsset,
      if (displayName != null) 'display_name': displayName,
      if (status != null) 'status': status,
      if (relatedSymbols != null) 'related_symbols': relatedSymbols,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CoinsMetadataCompanion copyWith({
    Value<String>? symbol,
    Value<String>? baseAsset,
    Value<String>? quoteAsset,
    Value<String>? displayName,
    Value<String>? status,
    Value<List<String>>? relatedSymbols,
    Value<int>? rowid,
  }) {
    return CoinsMetadataCompanion(
      symbol: symbol ?? this.symbol,
      baseAsset: baseAsset ?? this.baseAsset,
      quoteAsset: quoteAsset ?? this.quoteAsset,
      displayName: displayName ?? this.displayName,
      status: status ?? this.status,
      relatedSymbols: relatedSymbols ?? this.relatedSymbols,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (baseAsset.present) {
      map['base_asset'] = Variable<String>(baseAsset.value);
    }
    if (quoteAsset.present) {
      map['quote_asset'] = Variable<String>(quoteAsset.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (relatedSymbols.present) {
      map['related_symbols'] = Variable<String>(
        $CoinsMetadataTable.$converterrelatedSymbols.toSql(
          relatedSymbols.value,
        ),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoinsMetadataCompanion(')
          ..write('symbol: $symbol, ')
          ..write('baseAsset: $baseAsset, ')
          ..write('quoteAsset: $quoteAsset, ')
          ..write('displayName: $displayName, ')
          ..write('status: $status, ')
          ..write('relatedSymbols: $relatedSymbols, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CrptoDB extends GeneratedDatabase {
  _$CrptoDB(QueryExecutor e) : super(e);
  $CrptoDBManager get managers => $CrptoDBManager(this);
  late final $SelectedCoinsTable selectedCoins = $SelectedCoinsTable(this);
  late final $CoinsMetadataTable coinsMetadata = $CoinsMetadataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    selectedCoins,
    coinsMetadata,
  ];
}

typedef $$SelectedCoinsTableCreateCompanionBuilder =
    SelectedCoinsCompanion Function({required String symbol, Value<int> rowid});
typedef $$SelectedCoinsTableUpdateCompanionBuilder =
    SelectedCoinsCompanion Function({Value<String> symbol, Value<int> rowid});

class $$SelectedCoinsTableFilterComposer
    extends Composer<_$CrptoDB, $SelectedCoinsTable> {
  $$SelectedCoinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SelectedCoinsTableOrderingComposer
    extends Composer<_$CrptoDB, $SelectedCoinsTable> {
  $$SelectedCoinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SelectedCoinsTableAnnotationComposer
    extends Composer<_$CrptoDB, $SelectedCoinsTable> {
  $$SelectedCoinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);
}

class $$SelectedCoinsTableTableManager
    extends
        RootTableManager<
          _$CrptoDB,
          $SelectedCoinsTable,
          SelectedCoinDTO,
          $$SelectedCoinsTableFilterComposer,
          $$SelectedCoinsTableOrderingComposer,
          $$SelectedCoinsTableAnnotationComposer,
          $$SelectedCoinsTableCreateCompanionBuilder,
          $$SelectedCoinsTableUpdateCompanionBuilder,
          (
            SelectedCoinDTO,
            BaseReferences<_$CrptoDB, $SelectedCoinsTable, SelectedCoinDTO>,
          ),
          SelectedCoinDTO,
          PrefetchHooks Function()
        > {
  $$SelectedCoinsTableTableManager(_$CrptoDB db, $SelectedCoinsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SelectedCoinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$SelectedCoinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SelectedCoinsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> symbol = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SelectedCoinsCompanion(symbol: symbol, rowid: rowid),
          createCompanionCallback:
              ({
                required String symbol,
                Value<int> rowid = const Value.absent(),
              }) => SelectedCoinsCompanion.insert(symbol: symbol, rowid: rowid),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SelectedCoinsTableProcessedTableManager =
    ProcessedTableManager<
      _$CrptoDB,
      $SelectedCoinsTable,
      SelectedCoinDTO,
      $$SelectedCoinsTableFilterComposer,
      $$SelectedCoinsTableOrderingComposer,
      $$SelectedCoinsTableAnnotationComposer,
      $$SelectedCoinsTableCreateCompanionBuilder,
      $$SelectedCoinsTableUpdateCompanionBuilder,
      (
        SelectedCoinDTO,
        BaseReferences<_$CrptoDB, $SelectedCoinsTable, SelectedCoinDTO>,
      ),
      SelectedCoinDTO,
      PrefetchHooks Function()
    >;
typedef $$CoinsMetadataTableCreateCompanionBuilder =
    CoinsMetadataCompanion Function({
      required String symbol,
      required String baseAsset,
      required String quoteAsset,
      required String displayName,
      required String status,
      required List<String> relatedSymbols,
      Value<int> rowid,
    });
typedef $$CoinsMetadataTableUpdateCompanionBuilder =
    CoinsMetadataCompanion Function({
      Value<String> symbol,
      Value<String> baseAsset,
      Value<String> quoteAsset,
      Value<String> displayName,
      Value<String> status,
      Value<List<String>> relatedSymbols,
      Value<int> rowid,
    });

class $$CoinsMetadataTableFilterComposer
    extends Composer<_$CrptoDB, $CoinsMetadataTable> {
  $$CoinsMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseAsset => $composableBuilder(
    column: $table.baseAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quoteAsset => $composableBuilder(
    column: $table.quoteAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get relatedSymbols => $composableBuilder(
    column: $table.relatedSymbols,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$CoinsMetadataTableOrderingComposer
    extends Composer<_$CrptoDB, $CoinsMetadataTable> {
  $$CoinsMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseAsset => $composableBuilder(
    column: $table.baseAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quoteAsset => $composableBuilder(
    column: $table.quoteAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedSymbols => $composableBuilder(
    column: $table.relatedSymbols,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CoinsMetadataTableAnnotationComposer
    extends Composer<_$CrptoDB, $CoinsMetadataTable> {
  $$CoinsMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get baseAsset =>
      $composableBuilder(column: $table.baseAsset, builder: (column) => column);

  GeneratedColumn<String> get quoteAsset => $composableBuilder(
    column: $table.quoteAsset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get relatedSymbols =>
      $composableBuilder(
        column: $table.relatedSymbols,
        builder: (column) => column,
      );
}

class $$CoinsMetadataTableTableManager
    extends
        RootTableManager<
          _$CrptoDB,
          $CoinsMetadataTable,
          CoinMetadataDTO,
          $$CoinsMetadataTableFilterComposer,
          $$CoinsMetadataTableOrderingComposer,
          $$CoinsMetadataTableAnnotationComposer,
          $$CoinsMetadataTableCreateCompanionBuilder,
          $$CoinsMetadataTableUpdateCompanionBuilder,
          (
            CoinMetadataDTO,
            BaseReferences<_$CrptoDB, $CoinsMetadataTable, CoinMetadataDTO>,
          ),
          CoinMetadataDTO,
          PrefetchHooks Function()
        > {
  $$CoinsMetadataTableTableManager(_$CrptoDB db, $CoinsMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CoinsMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CoinsMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CoinsMetadataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> symbol = const Value.absent(),
                Value<String> baseAsset = const Value.absent(),
                Value<String> quoteAsset = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<List<String>> relatedSymbols = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoinsMetadataCompanion(
                symbol: symbol,
                baseAsset: baseAsset,
                quoteAsset: quoteAsset,
                displayName: displayName,
                status: status,
                relatedSymbols: relatedSymbols,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String symbol,
                required String baseAsset,
                required String quoteAsset,
                required String displayName,
                required String status,
                required List<String> relatedSymbols,
                Value<int> rowid = const Value.absent(),
              }) => CoinsMetadataCompanion.insert(
                symbol: symbol,
                baseAsset: baseAsset,
                quoteAsset: quoteAsset,
                displayName: displayName,
                status: status,
                relatedSymbols: relatedSymbols,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CoinsMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$CrptoDB,
      $CoinsMetadataTable,
      CoinMetadataDTO,
      $$CoinsMetadataTableFilterComposer,
      $$CoinsMetadataTableOrderingComposer,
      $$CoinsMetadataTableAnnotationComposer,
      $$CoinsMetadataTableCreateCompanionBuilder,
      $$CoinsMetadataTableUpdateCompanionBuilder,
      (
        CoinMetadataDTO,
        BaseReferences<_$CrptoDB, $CoinsMetadataTable, CoinMetadataDTO>,
      ),
      CoinMetadataDTO,
      PrefetchHooks Function()
    >;

class $CrptoDBManager {
  final _$CrptoDB _db;
  $CrptoDBManager(this._db);
  $$SelectedCoinsTableTableManager get selectedCoins =>
      $$SelectedCoinsTableTableManager(_db, _db.selectedCoins);
  $$CoinsMetadataTableTableManager get coinsMetadata =>
      $$CoinsMetadataTableTableManager(_db, _db.coinsMetadata);
}

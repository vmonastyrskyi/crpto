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
  @override
  List<GeneratedColumn> get $columns => [symbol, baseAsset, quoteAsset];
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
    );
  }

  @override
  $SelectedCoinsTable createAlias(String alias) {
    return $SelectedCoinsTable(attachedDatabase, alias);
  }
}

class SelectedCoinDTO extends DataClass implements Insertable<SelectedCoinDTO> {
  final String symbol;
  final String baseAsset;
  final String quoteAsset;
  const SelectedCoinDTO({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['symbol'] = Variable<String>(symbol);
    map['base_asset'] = Variable<String>(baseAsset);
    map['quote_asset'] = Variable<String>(quoteAsset);
    return map;
  }

  SelectedCoinsCompanion toCompanion(bool nullToAbsent) {
    return SelectedCoinsCompanion(
      symbol: Value(symbol),
      baseAsset: Value(baseAsset),
      quoteAsset: Value(quoteAsset),
    );
  }

  factory SelectedCoinDTO.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SelectedCoinDTO(
      symbol: serializer.fromJson<String>(json['symbol']),
      baseAsset: serializer.fromJson<String>(json['baseAsset']),
      quoteAsset: serializer.fromJson<String>(json['quoteAsset']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'baseAsset': serializer.toJson<String>(baseAsset),
      'quoteAsset': serializer.toJson<String>(quoteAsset),
    };
  }

  SelectedCoinDTO copyWith({
    String? symbol,
    String? baseAsset,
    String? quoteAsset,
  }) => SelectedCoinDTO(
    symbol: symbol ?? this.symbol,
    baseAsset: baseAsset ?? this.baseAsset,
    quoteAsset: quoteAsset ?? this.quoteAsset,
  );
  SelectedCoinDTO copyWithCompanion(SelectedCoinsCompanion data) {
    return SelectedCoinDTO(
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      baseAsset: data.baseAsset.present ? data.baseAsset.value : this.baseAsset,
      quoteAsset:
          data.quoteAsset.present ? data.quoteAsset.value : this.quoteAsset,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SelectedCoinDTO(')
          ..write('symbol: $symbol, ')
          ..write('baseAsset: $baseAsset, ')
          ..write('quoteAsset: $quoteAsset')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(symbol, baseAsset, quoteAsset);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectedCoinDTO &&
          other.symbol == this.symbol &&
          other.baseAsset == this.baseAsset &&
          other.quoteAsset == this.quoteAsset);
}

class SelectedCoinsCompanion extends UpdateCompanion<SelectedCoinDTO> {
  final Value<String> symbol;
  final Value<String> baseAsset;
  final Value<String> quoteAsset;
  final Value<int> rowid;
  const SelectedCoinsCompanion({
    this.symbol = const Value.absent(),
    this.baseAsset = const Value.absent(),
    this.quoteAsset = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SelectedCoinsCompanion.insert({
    required String symbol,
    required String baseAsset,
    required String quoteAsset,
    this.rowid = const Value.absent(),
  }) : symbol = Value(symbol),
       baseAsset = Value(baseAsset),
       quoteAsset = Value(quoteAsset);
  static Insertable<SelectedCoinDTO> custom({
    Expression<String>? symbol,
    Expression<String>? baseAsset,
    Expression<String>? quoteAsset,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (baseAsset != null) 'base_asset': baseAsset,
      if (quoteAsset != null) 'quote_asset': quoteAsset,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SelectedCoinsCompanion copyWith({
    Value<String>? symbol,
    Value<String>? baseAsset,
    Value<String>? quoteAsset,
    Value<int>? rowid,
  }) {
    return SelectedCoinsCompanion(
      symbol: symbol ?? this.symbol,
      baseAsset: baseAsset ?? this.baseAsset,
      quoteAsset: quoteAsset ?? this.quoteAsset,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SelectedCoinsCompanion(')
          ..write('symbol: $symbol, ')
          ..write('baseAsset: $baseAsset, ')
          ..write('quoteAsset: $quoteAsset, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CrptoDB extends GeneratedDatabase {
  _$CrptoDB(QueryExecutor e) : super(e);
  $CrptoDBManager get managers => $CrptoDBManager(this);
  late final $SelectedCoinsTable selectedCoins = $SelectedCoinsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [selectedCoins];
}

typedef $$SelectedCoinsTableCreateCompanionBuilder =
    SelectedCoinsCompanion Function({
      required String symbol,
      required String baseAsset,
      required String quoteAsset,
      Value<int> rowid,
    });
typedef $$SelectedCoinsTableUpdateCompanionBuilder =
    SelectedCoinsCompanion Function({
      Value<String> symbol,
      Value<String> baseAsset,
      Value<String> quoteAsset,
      Value<int> rowid,
    });

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

  ColumnFilters<String> get baseAsset => $composableBuilder(
    column: $table.baseAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quoteAsset => $composableBuilder(
    column: $table.quoteAsset,
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

  ColumnOrderings<String> get baseAsset => $composableBuilder(
    column: $table.baseAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quoteAsset => $composableBuilder(
    column: $table.quoteAsset,
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

  GeneratedColumn<String> get baseAsset =>
      $composableBuilder(column: $table.baseAsset, builder: (column) => column);

  GeneratedColumn<String> get quoteAsset => $composableBuilder(
    column: $table.quoteAsset,
    builder: (column) => column,
  );
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
                Value<String> baseAsset = const Value.absent(),
                Value<String> quoteAsset = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SelectedCoinsCompanion(
                symbol: symbol,
                baseAsset: baseAsset,
                quoteAsset: quoteAsset,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String symbol,
                required String baseAsset,
                required String quoteAsset,
                Value<int> rowid = const Value.absent(),
              }) => SelectedCoinsCompanion.insert(
                symbol: symbol,
                baseAsset: baseAsset,
                quoteAsset: quoteAsset,
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

class $CrptoDBManager {
  final _$CrptoDB _db;
  $CrptoDBManager(this._db);
  $$SelectedCoinsTableTableManager get selectedCoins =>
      $$SelectedCoinsTableTableManager(_db, _db.selectedCoins);
}

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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
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
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CoinCategory, String> category =
      GeneratedColumn<String>(
        'category',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CoinCategory>($CoinsMetadataTable.$convertercategory);
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
    'logo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
    'rank',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    symbol,
    baseAsset,
    quoteAsset,
    slug,
    name,
    description,
    category,
    logo,
    dateAdded,
    rank,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('logo')) {
      context.handle(
        _logoMeta,
        logo.isAcceptableOrUnknown(data['logo']!, _logoMeta),
      );
    } else if (isInserting) {
      context.missing(_logoMeta);
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('rank')) {
      context.handle(
        _rankMeta,
        rank.isAcceptableOrUnknown(data['rank']!, _rankMeta),
      );
    } else if (isInserting) {
      context.missing(_rankMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoinMetadataDTO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoinMetadataDTO(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
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
      slug:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slug'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      category: $CoinsMetadataTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      logo:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}logo'],
          )!,
      dateAdded:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_added'],
          )!,
      rank:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rank'],
          )!,
    );
  }

  @override
  $CoinsMetadataTable createAlias(String alias) {
    return $CoinsMetadataTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CoinCategory, String, String> $convertercategory =
      const EnumNameConverter<CoinCategory>(CoinCategory.values);
}

class CoinMetadataDTO extends DataClass implements Insertable<CoinMetadataDTO> {
  final int id;
  final String symbol;
  final String baseAsset;
  final String quoteAsset;
  final String slug;
  final String name;
  final String description;
  final CoinCategory category;
  final String logo;
  final DateTime dateAdded;
  final int rank;
  const CoinMetadataDTO({
    required this.id,
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.slug,
    required this.name,
    required this.description,
    required this.category,
    required this.logo,
    required this.dateAdded,
    required this.rank,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['symbol'] = Variable<String>(symbol);
    map['base_asset'] = Variable<String>(baseAsset);
    map['quote_asset'] = Variable<String>(quoteAsset);
    map['slug'] = Variable<String>(slug);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    {
      map['category'] = Variable<String>(
        $CoinsMetadataTable.$convertercategory.toSql(category),
      );
    }
    map['logo'] = Variable<String>(logo);
    map['date_added'] = Variable<DateTime>(dateAdded);
    map['rank'] = Variable<int>(rank);
    return map;
  }

  CoinsMetadataCompanion toCompanion(bool nullToAbsent) {
    return CoinsMetadataCompanion(
      id: Value(id),
      symbol: Value(symbol),
      baseAsset: Value(baseAsset),
      quoteAsset: Value(quoteAsset),
      slug: Value(slug),
      name: Value(name),
      description: Value(description),
      category: Value(category),
      logo: Value(logo),
      dateAdded: Value(dateAdded),
      rank: Value(rank),
    );
  }

  factory CoinMetadataDTO.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoinMetadataDTO(
      id: serializer.fromJson<int>(json['id']),
      symbol: serializer.fromJson<String>(json['symbol']),
      baseAsset: serializer.fromJson<String>(json['baseAsset']),
      quoteAsset: serializer.fromJson<String>(json['quoteAsset']),
      slug: serializer.fromJson<String>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      category: $CoinsMetadataTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      logo: serializer.fromJson<String>(json['logo']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      rank: serializer.fromJson<int>(json['rank']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'symbol': serializer.toJson<String>(symbol),
      'baseAsset': serializer.toJson<String>(baseAsset),
      'quoteAsset': serializer.toJson<String>(quoteAsset),
      'slug': serializer.toJson<String>(slug),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(
        $CoinsMetadataTable.$convertercategory.toJson(category),
      ),
      'logo': serializer.toJson<String>(logo),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'rank': serializer.toJson<int>(rank),
    };
  }

  CoinMetadataDTO copyWith({
    int? id,
    String? symbol,
    String? baseAsset,
    String? quoteAsset,
    String? slug,
    String? name,
    String? description,
    CoinCategory? category,
    String? logo,
    DateTime? dateAdded,
    int? rank,
  }) => CoinMetadataDTO(
    id: id ?? this.id,
    symbol: symbol ?? this.symbol,
    baseAsset: baseAsset ?? this.baseAsset,
    quoteAsset: quoteAsset ?? this.quoteAsset,
    slug: slug ?? this.slug,
    name: name ?? this.name,
    description: description ?? this.description,
    category: category ?? this.category,
    logo: logo ?? this.logo,
    dateAdded: dateAdded ?? this.dateAdded,
    rank: rank ?? this.rank,
  );
  CoinMetadataDTO copyWithCompanion(CoinsMetadataCompanion data) {
    return CoinMetadataDTO(
      id: data.id.present ? data.id.value : this.id,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      baseAsset: data.baseAsset.present ? data.baseAsset.value : this.baseAsset,
      quoteAsset:
          data.quoteAsset.present ? data.quoteAsset.value : this.quoteAsset,
      slug: data.slug.present ? data.slug.value : this.slug,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      logo: data.logo.present ? data.logo.value : this.logo,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      rank: data.rank.present ? data.rank.value : this.rank,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoinMetadataDTO(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('baseAsset: $baseAsset, ')
          ..write('quoteAsset: $quoteAsset, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('logo: $logo, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('rank: $rank')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    symbol,
    baseAsset,
    quoteAsset,
    slug,
    name,
    description,
    category,
    logo,
    dateAdded,
    rank,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoinMetadataDTO &&
          other.id == this.id &&
          other.symbol == this.symbol &&
          other.baseAsset == this.baseAsset &&
          other.quoteAsset == this.quoteAsset &&
          other.slug == this.slug &&
          other.name == this.name &&
          other.description == this.description &&
          other.category == this.category &&
          other.logo == this.logo &&
          other.dateAdded == this.dateAdded &&
          other.rank == this.rank);
}

class CoinsMetadataCompanion extends UpdateCompanion<CoinMetadataDTO> {
  final Value<int> id;
  final Value<String> symbol;
  final Value<String> baseAsset;
  final Value<String> quoteAsset;
  final Value<String> slug;
  final Value<String> name;
  final Value<String> description;
  final Value<CoinCategory> category;
  final Value<String> logo;
  final Value<DateTime> dateAdded;
  final Value<int> rank;
  const CoinsMetadataCompanion({
    this.id = const Value.absent(),
    this.symbol = const Value.absent(),
    this.baseAsset = const Value.absent(),
    this.quoteAsset = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.logo = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.rank = const Value.absent(),
  });
  CoinsMetadataCompanion.insert({
    this.id = const Value.absent(),
    required String symbol,
    required String baseAsset,
    required String quoteAsset,
    required String slug,
    required String name,
    required String description,
    required CoinCategory category,
    required String logo,
    required DateTime dateAdded,
    required int rank,
  }) : symbol = Value(symbol),
       baseAsset = Value(baseAsset),
       quoteAsset = Value(quoteAsset),
       slug = Value(slug),
       name = Value(name),
       description = Value(description),
       category = Value(category),
       logo = Value(logo),
       dateAdded = Value(dateAdded),
       rank = Value(rank);
  static Insertable<CoinMetadataDTO> custom({
    Expression<int>? id,
    Expression<String>? symbol,
    Expression<String>? baseAsset,
    Expression<String>? quoteAsset,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? logo,
    Expression<DateTime>? dateAdded,
    Expression<int>? rank,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symbol != null) 'symbol': symbol,
      if (baseAsset != null) 'base_asset': baseAsset,
      if (quoteAsset != null) 'quote_asset': quoteAsset,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (logo != null) 'logo': logo,
      if (dateAdded != null) 'date_added': dateAdded,
      if (rank != null) 'rank': rank,
    });
  }

  CoinsMetadataCompanion copyWith({
    Value<int>? id,
    Value<String>? symbol,
    Value<String>? baseAsset,
    Value<String>? quoteAsset,
    Value<String>? slug,
    Value<String>? name,
    Value<String>? description,
    Value<CoinCategory>? category,
    Value<String>? logo,
    Value<DateTime>? dateAdded,
    Value<int>? rank,
  }) {
    return CoinsMetadataCompanion(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      baseAsset: baseAsset ?? this.baseAsset,
      quoteAsset: quoteAsset ?? this.quoteAsset,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      logo: logo ?? this.logo,
      dateAdded: dateAdded ?? this.dateAdded,
      rank: rank ?? this.rank,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (baseAsset.present) {
      map['base_asset'] = Variable<String>(baseAsset.value);
    }
    if (quoteAsset.present) {
      map['quote_asset'] = Variable<String>(quoteAsset.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $CoinsMetadataTable.$convertercategory.toSql(category.value),
      );
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoinsMetadataCompanion(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('baseAsset: $baseAsset, ')
          ..write('quoteAsset: $quoteAsset, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('logo: $logo, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('rank: $rank')
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
      Value<int> id,
      required String symbol,
      required String baseAsset,
      required String quoteAsset,
      required String slug,
      required String name,
      required String description,
      required CoinCategory category,
      required String logo,
      required DateTime dateAdded,
      required int rank,
    });
typedef $$CoinsMetadataTableUpdateCompanionBuilder =
    CoinsMetadataCompanion Function({
      Value<int> id,
      Value<String> symbol,
      Value<String> baseAsset,
      Value<String> quoteAsset,
      Value<String> slug,
      Value<String> name,
      Value<String> description,
      Value<CoinCategory> category,
      Value<String> logo,
      Value<DateTime> dateAdded,
      Value<int> rank,
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

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

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CoinCategory, CoinCategory, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnFilters(column),
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

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

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rank => $composableBuilder(
    column: $table.rank,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get baseAsset =>
      $composableBuilder(column: $table.baseAsset, builder: (column) => column);

  GeneratedColumn<String> get quoteAsset => $composableBuilder(
    column: $table.quoteAsset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<CoinCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<int> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);
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
                Value<int> id = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<String> baseAsset = const Value.absent(),
                Value<String> quoteAsset = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<CoinCategory> category = const Value.absent(),
                Value<String> logo = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<int> rank = const Value.absent(),
              }) => CoinsMetadataCompanion(
                id: id,
                symbol: symbol,
                baseAsset: baseAsset,
                quoteAsset: quoteAsset,
                slug: slug,
                name: name,
                description: description,
                category: category,
                logo: logo,
                dateAdded: dateAdded,
                rank: rank,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String symbol,
                required String baseAsset,
                required String quoteAsset,
                required String slug,
                required String name,
                required String description,
                required CoinCategory category,
                required String logo,
                required DateTime dateAdded,
                required int rank,
              }) => CoinsMetadataCompanion.insert(
                id: id,
                symbol: symbol,
                baseAsset: baseAsset,
                quoteAsset: quoteAsset,
                slug: slug,
                name: name,
                description: description,
                category: category,
                logo: logo,
                dateAdded: dateAdded,
                rank: rank,
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

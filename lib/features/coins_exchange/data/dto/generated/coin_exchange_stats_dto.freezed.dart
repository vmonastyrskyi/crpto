// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_exchange_stats_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CoinExchangeStatsDTO _$CoinExchangeStatsDTOFromJson(Map<String, dynamic> json) {
  return _CoinExchangeStatsDTO.fromJson(json);
}

/// @nodoc
mixin _$CoinExchangeStatsDTO {
  @JsonKey(name: 'symbol')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceChange')
  String get priceChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceChangePercent')
  String get priceChangePercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastPrice')
  String get lastPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'openPrice')
  String get openPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'highPrice')
  String get highPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'lowPrice')
  String get lowPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume')
  String get volume => throw _privateConstructorUsedError;
  @JsonKey(name: 'quoteVolume')
  String get quoteVolume => throw _privateConstructorUsedError;

  /// Serializes this CoinExchangeStatsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinExchangeStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinExchangeStatsDTOCopyWith<CoinExchangeStatsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinExchangeStatsDTOCopyWith<$Res> {
  factory $CoinExchangeStatsDTOCopyWith(
    CoinExchangeStatsDTO value,
    $Res Function(CoinExchangeStatsDTO) then,
  ) = _$CoinExchangeStatsDTOCopyWithImpl<$Res, CoinExchangeStatsDTO>;
  @useResult
  $Res call({
    @JsonKey(name: 'symbol') String symbol,
    @JsonKey(name: 'priceChange') String priceChange,
    @JsonKey(name: 'priceChangePercent') String priceChangePercent,
    @JsonKey(name: 'lastPrice') String lastPrice,
    @JsonKey(name: 'openPrice') String openPrice,
    @JsonKey(name: 'highPrice') String highPrice,
    @JsonKey(name: 'lowPrice') String lowPrice,
    @JsonKey(name: 'volume') String volume,
    @JsonKey(name: 'quoteVolume') String quoteVolume,
  });
}

/// @nodoc
class _$CoinExchangeStatsDTOCopyWithImpl<
  $Res,
  $Val extends CoinExchangeStatsDTO
>
    implements $CoinExchangeStatsDTOCopyWith<$Res> {
  _$CoinExchangeStatsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinExchangeStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? priceChange = null,
    Object? priceChangePercent = null,
    Object? lastPrice = null,
    Object? openPrice = null,
    Object? highPrice = null,
    Object? lowPrice = null,
    Object? volume = null,
    Object? quoteVolume = null,
  }) {
    return _then(
      _value.copyWith(
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            priceChange:
                null == priceChange
                    ? _value.priceChange
                    : priceChange // ignore: cast_nullable_to_non_nullable
                        as String,
            priceChangePercent:
                null == priceChangePercent
                    ? _value.priceChangePercent
                    : priceChangePercent // ignore: cast_nullable_to_non_nullable
                        as String,
            lastPrice:
                null == lastPrice
                    ? _value.lastPrice
                    : lastPrice // ignore: cast_nullable_to_non_nullable
                        as String,
            openPrice:
                null == openPrice
                    ? _value.openPrice
                    : openPrice // ignore: cast_nullable_to_non_nullable
                        as String,
            highPrice:
                null == highPrice
                    ? _value.highPrice
                    : highPrice // ignore: cast_nullable_to_non_nullable
                        as String,
            lowPrice:
                null == lowPrice
                    ? _value.lowPrice
                    : lowPrice // ignore: cast_nullable_to_non_nullable
                        as String,
            volume:
                null == volume
                    ? _value.volume
                    : volume // ignore: cast_nullable_to_non_nullable
                        as String,
            quoteVolume:
                null == quoteVolume
                    ? _value.quoteVolume
                    : quoteVolume // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoinExchangeStatsDTOImplCopyWith<$Res>
    implements $CoinExchangeStatsDTOCopyWith<$Res> {
  factory _$$CoinExchangeStatsDTOImplCopyWith(
    _$CoinExchangeStatsDTOImpl value,
    $Res Function(_$CoinExchangeStatsDTOImpl) then,
  ) = __$$CoinExchangeStatsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'symbol') String symbol,
    @JsonKey(name: 'priceChange') String priceChange,
    @JsonKey(name: 'priceChangePercent') String priceChangePercent,
    @JsonKey(name: 'lastPrice') String lastPrice,
    @JsonKey(name: 'openPrice') String openPrice,
    @JsonKey(name: 'highPrice') String highPrice,
    @JsonKey(name: 'lowPrice') String lowPrice,
    @JsonKey(name: 'volume') String volume,
    @JsonKey(name: 'quoteVolume') String quoteVolume,
  });
}

/// @nodoc
class __$$CoinExchangeStatsDTOImplCopyWithImpl<$Res>
    extends _$CoinExchangeStatsDTOCopyWithImpl<$Res, _$CoinExchangeStatsDTOImpl>
    implements _$$CoinExchangeStatsDTOImplCopyWith<$Res> {
  __$$CoinExchangeStatsDTOImplCopyWithImpl(
    _$CoinExchangeStatsDTOImpl _value,
    $Res Function(_$CoinExchangeStatsDTOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoinExchangeStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? priceChange = null,
    Object? priceChangePercent = null,
    Object? lastPrice = null,
    Object? openPrice = null,
    Object? highPrice = null,
    Object? lowPrice = null,
    Object? volume = null,
    Object? quoteVolume = null,
  }) {
    return _then(
      _$CoinExchangeStatsDTOImpl(
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        priceChange:
            null == priceChange
                ? _value.priceChange
                : priceChange // ignore: cast_nullable_to_non_nullable
                    as String,
        priceChangePercent:
            null == priceChangePercent
                ? _value.priceChangePercent
                : priceChangePercent // ignore: cast_nullable_to_non_nullable
                    as String,
        lastPrice:
            null == lastPrice
                ? _value.lastPrice
                : lastPrice // ignore: cast_nullable_to_non_nullable
                    as String,
        openPrice:
            null == openPrice
                ? _value.openPrice
                : openPrice // ignore: cast_nullable_to_non_nullable
                    as String,
        highPrice:
            null == highPrice
                ? _value.highPrice
                : highPrice // ignore: cast_nullable_to_non_nullable
                    as String,
        lowPrice:
            null == lowPrice
                ? _value.lowPrice
                : lowPrice // ignore: cast_nullable_to_non_nullable
                    as String,
        volume:
            null == volume
                ? _value.volume
                : volume // ignore: cast_nullable_to_non_nullable
                    as String,
        quoteVolume:
            null == quoteVolume
                ? _value.quoteVolume
                : quoteVolume // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinExchangeStatsDTOImpl implements _CoinExchangeStatsDTO {
  _$CoinExchangeStatsDTOImpl({
    @JsonKey(name: 'symbol') required this.symbol,
    @JsonKey(name: 'priceChange') required this.priceChange,
    @JsonKey(name: 'priceChangePercent') required this.priceChangePercent,
    @JsonKey(name: 'lastPrice') required this.lastPrice,
    @JsonKey(name: 'openPrice') required this.openPrice,
    @JsonKey(name: 'highPrice') required this.highPrice,
    @JsonKey(name: 'lowPrice') required this.lowPrice,
    @JsonKey(name: 'volume') required this.volume,
    @JsonKey(name: 'quoteVolume') required this.quoteVolume,
  });

  factory _$CoinExchangeStatsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinExchangeStatsDTOImplFromJson(json);

  @override
  @JsonKey(name: 'symbol')
  final String symbol;
  @override
  @JsonKey(name: 'priceChange')
  final String priceChange;
  @override
  @JsonKey(name: 'priceChangePercent')
  final String priceChangePercent;
  @override
  @JsonKey(name: 'lastPrice')
  final String lastPrice;
  @override
  @JsonKey(name: 'openPrice')
  final String openPrice;
  @override
  @JsonKey(name: 'highPrice')
  final String highPrice;
  @override
  @JsonKey(name: 'lowPrice')
  final String lowPrice;
  @override
  @JsonKey(name: 'volume')
  final String volume;
  @override
  @JsonKey(name: 'quoteVolume')
  final String quoteVolume;

  @override
  String toString() {
    return 'CoinExchangeStatsDTO(symbol: $symbol, priceChange: $priceChange, priceChangePercent: $priceChangePercent, lastPrice: $lastPrice, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, volume: $volume, quoteVolume: $quoteVolume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinExchangeStatsDTOImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.priceChange, priceChange) ||
                other.priceChange == priceChange) &&
            (identical(other.priceChangePercent, priceChangePercent) ||
                other.priceChangePercent == priceChangePercent) &&
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice) &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.quoteVolume, quoteVolume) ||
                other.quoteVolume == quoteVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    symbol,
    priceChange,
    priceChangePercent,
    lastPrice,
    openPrice,
    highPrice,
    lowPrice,
    volume,
    quoteVolume,
  );

  /// Create a copy of CoinExchangeStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinExchangeStatsDTOImplCopyWith<_$CoinExchangeStatsDTOImpl>
  get copyWith =>
      __$$CoinExchangeStatsDTOImplCopyWithImpl<_$CoinExchangeStatsDTOImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinExchangeStatsDTOImplToJson(this);
  }
}

abstract class _CoinExchangeStatsDTO implements CoinExchangeStatsDTO {
  factory _CoinExchangeStatsDTO({
    @JsonKey(name: 'symbol') required final String symbol,
    @JsonKey(name: 'priceChange') required final String priceChange,
    @JsonKey(name: 'priceChangePercent')
    required final String priceChangePercent,
    @JsonKey(name: 'lastPrice') required final String lastPrice,
    @JsonKey(name: 'openPrice') required final String openPrice,
    @JsonKey(name: 'highPrice') required final String highPrice,
    @JsonKey(name: 'lowPrice') required final String lowPrice,
    @JsonKey(name: 'volume') required final String volume,
    @JsonKey(name: 'quoteVolume') required final String quoteVolume,
  }) = _$CoinExchangeStatsDTOImpl;

  factory _CoinExchangeStatsDTO.fromJson(Map<String, dynamic> json) =
      _$CoinExchangeStatsDTOImpl.fromJson;

  @override
  @JsonKey(name: 'symbol')
  String get symbol;
  @override
  @JsonKey(name: 'priceChange')
  String get priceChange;
  @override
  @JsonKey(name: 'priceChangePercent')
  String get priceChangePercent;
  @override
  @JsonKey(name: 'lastPrice')
  String get lastPrice;
  @override
  @JsonKey(name: 'openPrice')
  String get openPrice;
  @override
  @JsonKey(name: 'highPrice')
  String get highPrice;
  @override
  @JsonKey(name: 'lowPrice')
  String get lowPrice;
  @override
  @JsonKey(name: 'volume')
  String get volume;
  @override
  @JsonKey(name: 'quoteVolume')
  String get quoteVolume;

  /// Create a copy of CoinExchangeStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinExchangeStatsDTOImplCopyWith<_$CoinExchangeStatsDTOImpl>
  get copyWith => throw _privateConstructorUsedError;
}

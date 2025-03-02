// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_exchange_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinExchangeStats {

 String get symbol; double get priceChange; double get priceChangePercent; double get lastPrice; double get openPrice; double get highPrice; double get lowPrice; double get volume; double get quoteVolume;
/// Create a copy of CoinExchangeStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinExchangeStatsCopyWith<CoinExchangeStats> get copyWith => _$CoinExchangeStatsCopyWithImpl<CoinExchangeStats>(this as CoinExchangeStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinExchangeStats&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.priceChange, priceChange) || other.priceChange == priceChange)&&(identical(other.priceChangePercent, priceChangePercent) || other.priceChangePercent == priceChangePercent)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.quoteVolume, quoteVolume) || other.quoteVolume == quoteVolume));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,priceChange,priceChangePercent,lastPrice,openPrice,highPrice,lowPrice,volume,quoteVolume);

@override
String toString() {
  return 'CoinExchangeStats(symbol: $symbol, priceChange: $priceChange, priceChangePercent: $priceChangePercent, lastPrice: $lastPrice, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, volume: $volume, quoteVolume: $quoteVolume)';
}


}

/// @nodoc
abstract mixin class $CoinExchangeStatsCopyWith<$Res>  {
  factory $CoinExchangeStatsCopyWith(CoinExchangeStats value, $Res Function(CoinExchangeStats) _then) = _$CoinExchangeStatsCopyWithImpl;
@useResult
$Res call({
 String symbol, double priceChange, double priceChangePercent, double lastPrice, double openPrice, double highPrice, double lowPrice, double volume, double quoteVolume
});




}
/// @nodoc
class _$CoinExchangeStatsCopyWithImpl<$Res>
    implements $CoinExchangeStatsCopyWith<$Res> {
  _$CoinExchangeStatsCopyWithImpl(this._self, this._then);

  final CoinExchangeStats _self;
  final $Res Function(CoinExchangeStats) _then;

/// Create a copy of CoinExchangeStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? priceChange = null,Object? priceChangePercent = null,Object? lastPrice = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? volume = null,Object? quoteVolume = null,}) {
  return _then(CoinExchangeStats(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,priceChange: null == priceChange ? _self.priceChange : priceChange // ignore: cast_nullable_to_non_nullable
as double,priceChangePercent: null == priceChangePercent ? _self.priceChangePercent : priceChangePercent // ignore: cast_nullable_to_non_nullable
as double,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as double,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,quoteVolume: null == quoteVolume ? _self.quoteVolume : quoteVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


// dart format on

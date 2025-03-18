// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_ticker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinTicker {

 String get symbol; double get priceChange; double get priceChangePercent; double get openPrice; double get highPrice; double get lowPrice; double get lastPrice; double get volume; double get quoteVolume; int get count;
/// Create a copy of CoinTicker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinTickerCopyWith<CoinTicker> get copyWith => _$CoinTickerCopyWithImpl<CoinTicker>(this as CoinTicker, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinTicker&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.priceChange, priceChange) || other.priceChange == priceChange)&&(identical(other.priceChangePercent, priceChangePercent) || other.priceChangePercent == priceChangePercent)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.quoteVolume, quoteVolume) || other.quoteVolume == quoteVolume)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,priceChange,priceChangePercent,openPrice,highPrice,lowPrice,lastPrice,volume,quoteVolume,count);

@override
String toString() {
  return 'CoinTicker(symbol: $symbol, priceChange: $priceChange, priceChangePercent: $priceChangePercent, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, lastPrice: $lastPrice, volume: $volume, quoteVolume: $quoteVolume, count: $count)';
}


}

/// @nodoc
abstract mixin class $CoinTickerCopyWith<$Res>  {
  factory $CoinTickerCopyWith(CoinTicker value, $Res Function(CoinTicker) _then) = _$CoinTickerCopyWithImpl;
@useResult
$Res call({
 String symbol, double priceChange, double priceChangePercent, double openPrice, double highPrice, double lowPrice, double lastPrice, double volume, double quoteVolume, int count
});




}
/// @nodoc
class _$CoinTickerCopyWithImpl<$Res>
    implements $CoinTickerCopyWith<$Res> {
  _$CoinTickerCopyWithImpl(this._self, this._then);

  final CoinTicker _self;
  final $Res Function(CoinTicker) _then;

/// Create a copy of CoinTicker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? priceChange = null,Object? priceChangePercent = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? lastPrice = null,Object? volume = null,Object? quoteVolume = null,Object? count = null,}) {
  return _then(CoinTicker(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,priceChange: null == priceChange ? _self.priceChange : priceChange // ignore: cast_nullable_to_non_nullable
as double,priceChangePercent: null == priceChangePercent ? _self.priceChangePercent : priceChangePercent // ignore: cast_nullable_to_non_nullable
as double,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,quoteVolume: null == quoteVolume ? _self.quoteVolume : quoteVolume // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on

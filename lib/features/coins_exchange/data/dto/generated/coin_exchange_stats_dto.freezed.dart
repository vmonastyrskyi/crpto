// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_exchange_stats_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinExchangeStatsDTO {

 String get symbol; String get priceChange; String get priceChangePercent; String get lastPrice; String get openPrice; String get highPrice; String get lowPrice; String get volume; String get quoteVolume;
/// Create a copy of CoinExchangeStatsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinExchangeStatsDTOCopyWith<CoinExchangeStatsDTO> get copyWith => _$CoinExchangeStatsDTOCopyWithImpl<CoinExchangeStatsDTO>(this as CoinExchangeStatsDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinExchangeStatsDTO&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.priceChange, priceChange) || other.priceChange == priceChange)&&(identical(other.priceChangePercent, priceChangePercent) || other.priceChangePercent == priceChangePercent)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.quoteVolume, quoteVolume) || other.quoteVolume == quoteVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,priceChange,priceChangePercent,lastPrice,openPrice,highPrice,lowPrice,volume,quoteVolume);

@override
String toString() {
  return 'CoinExchangeStatsDTO(symbol: $symbol, priceChange: $priceChange, priceChangePercent: $priceChangePercent, lastPrice: $lastPrice, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, volume: $volume, quoteVolume: $quoteVolume)';
}


}

/// @nodoc
abstract mixin class $CoinExchangeStatsDTOCopyWith<$Res>  {
  factory $CoinExchangeStatsDTOCopyWith(CoinExchangeStatsDTO value, $Res Function(CoinExchangeStatsDTO) _then) = _$CoinExchangeStatsDTOCopyWithImpl;
@useResult
$Res call({
 String symbol, String priceChange, String priceChangePercent, String lastPrice, String openPrice, String highPrice, String lowPrice, String volume, String quoteVolume
});




}
/// @nodoc
class _$CoinExchangeStatsDTOCopyWithImpl<$Res>
    implements $CoinExchangeStatsDTOCopyWith<$Res> {
  _$CoinExchangeStatsDTOCopyWithImpl(this._self, this._then);

  final CoinExchangeStatsDTO _self;
  final $Res Function(CoinExchangeStatsDTO) _then;

/// Create a copy of CoinExchangeStatsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? priceChange = null,Object? priceChangePercent = null,Object? lastPrice = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? volume = null,Object? quoteVolume = null,}) {
  return _then(CoinExchangeStatsDTO(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,priceChange: null == priceChange ? _self.priceChange : priceChange // ignore: cast_nullable_to_non_nullable
as String,priceChangePercent: null == priceChangePercent ? _self.priceChangePercent : priceChangePercent // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as String,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as String,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as String,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,quoteVolume: null == quoteVolume ? _self.quoteVolume : quoteVolume // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on

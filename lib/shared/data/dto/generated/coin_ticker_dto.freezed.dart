// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_ticker_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinTickerDTO {

 String get symbol; String get priceChange; String get priceChangePercent; String get lastPrice; String get openPrice; String get highPrice; String get lowPrice; String get volume; String get quoteVolume; int get count;
/// Create a copy of CoinTickerDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinTickerDTOCopyWith<CoinTickerDTO> get copyWith => _$CoinTickerDTOCopyWithImpl<CoinTickerDTO>(this as CoinTickerDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinTickerDTO&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.priceChange, priceChange) || other.priceChange == priceChange)&&(identical(other.priceChangePercent, priceChangePercent) || other.priceChangePercent == priceChangePercent)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.quoteVolume, quoteVolume) || other.quoteVolume == quoteVolume)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,priceChange,priceChangePercent,lastPrice,openPrice,highPrice,lowPrice,volume,quoteVolume,count);

@override
String toString() {
  return 'CoinTickerDTO(symbol: $symbol, priceChange: $priceChange, priceChangePercent: $priceChangePercent, lastPrice: $lastPrice, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, volume: $volume, quoteVolume: $quoteVolume, count: $count)';
}


}

/// @nodoc
abstract mixin class $CoinTickerDTOCopyWith<$Res>  {
  factory $CoinTickerDTOCopyWith(CoinTickerDTO value, $Res Function(CoinTickerDTO) _then) = _$CoinTickerDTOCopyWithImpl;
@useResult
$Res call({
 String symbol, String priceChange, String priceChangePercent, String lastPrice, String openPrice, String highPrice, String lowPrice, String volume, String quoteVolume, int count
});




}
/// @nodoc
class _$CoinTickerDTOCopyWithImpl<$Res>
    implements $CoinTickerDTOCopyWith<$Res> {
  _$CoinTickerDTOCopyWithImpl(this._self, this._then);

  final CoinTickerDTO _self;
  final $Res Function(CoinTickerDTO) _then;

/// Create a copy of CoinTickerDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? priceChange = null,Object? priceChangePercent = null,Object? lastPrice = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? volume = null,Object? quoteVolume = null,Object? count = null,}) {
  return _then(CoinTickerDTO(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,priceChange: null == priceChange ? _self.priceChange : priceChange // ignore: cast_nullable_to_non_nullable
as String,priceChangePercent: null == priceChangePercent ? _self.priceChangePercent : priceChangePercent // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as String,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as String,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as String,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,quoteVolume: null == quoteVolume ? _self.quoteVolume : quoteVolume // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on

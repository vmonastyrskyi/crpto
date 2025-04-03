// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_kline_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinKlineDTO {

 int get openTime; String get openPrice; String get highPrice; String get lowPrice; String get closePrice; int get closeTime; String get volume; String get quoteVolume; int get count;
/// Create a copy of CoinKlineDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinKlineDTOCopyWith<CoinKlineDTO> get copyWith => _$CoinKlineDTOCopyWithImpl<CoinKlineDTO>(this as CoinKlineDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinKlineDTO&&(identical(other.openTime, openTime) || other.openTime == openTime)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.closePrice, closePrice) || other.closePrice == closePrice)&&(identical(other.closeTime, closeTime) || other.closeTime == closeTime)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.quoteVolume, quoteVolume) || other.quoteVolume == quoteVolume)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,openTime,openPrice,highPrice,lowPrice,closePrice,closeTime,volume,quoteVolume,count);

@override
String toString() {
  return 'CoinKlineDTO(openTime: $openTime, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, closePrice: $closePrice, closeTime: $closeTime, volume: $volume, quoteVolume: $quoteVolume, count: $count)';
}


}

/// @nodoc
abstract mixin class $CoinKlineDTOCopyWith<$Res>  {
  factory $CoinKlineDTOCopyWith(CoinKlineDTO value, $Res Function(CoinKlineDTO) _then) = _$CoinKlineDTOCopyWithImpl;
@useResult
$Res call({
 int openTime, String openPrice, String highPrice, String lowPrice, String closePrice, int closeTime, String volume, String quoteVolume, int count
});




}
/// @nodoc
class _$CoinKlineDTOCopyWithImpl<$Res>
    implements $CoinKlineDTOCopyWith<$Res> {
  _$CoinKlineDTOCopyWithImpl(this._self, this._then);

  final CoinKlineDTO _self;
  final $Res Function(CoinKlineDTO) _then;

/// Create a copy of CoinKlineDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openTime = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? closePrice = null,Object? closeTime = null,Object? volume = null,Object? quoteVolume = null,Object? count = null,}) {
  return _then(CoinKlineDTO(
openTime: null == openTime ? _self.openTime : openTime // ignore: cast_nullable_to_non_nullable
as int,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as String,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as String,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as String,closePrice: null == closePrice ? _self.closePrice : closePrice // ignore: cast_nullable_to_non_nullable
as String,closeTime: null == closeTime ? _self.closeTime : closeTime // ignore: cast_nullable_to_non_nullable
as int,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,quoteVolume: null == quoteVolume ? _self.quoteVolume : quoteVolume // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../kline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Kline {

 DateTime get openTime; double get openPrice; double get highPrice; double get lowPrice; double get closePrice; DateTime get closeTime;
/// Create a copy of Kline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlineCopyWith<Kline> get copyWith => _$KlineCopyWithImpl<Kline>(this as Kline, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Kline&&(identical(other.openTime, openTime) || other.openTime == openTime)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.closePrice, closePrice) || other.closePrice == closePrice)&&(identical(other.closeTime, closeTime) || other.closeTime == closeTime));
}


@override
int get hashCode => Object.hash(runtimeType,openTime,openPrice,highPrice,lowPrice,closePrice,closeTime);

@override
String toString() {
  return 'Kline(openTime: $openTime, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, closePrice: $closePrice, closeTime: $closeTime)';
}


}

/// @nodoc
abstract mixin class $KlineCopyWith<$Res>  {
  factory $KlineCopyWith(Kline value, $Res Function(Kline) _then) = _$KlineCopyWithImpl;
@useResult
$Res call({
 DateTime openTime, double openPrice, double highPrice, double lowPrice, double closePrice, DateTime closeTime
});




}
/// @nodoc
class _$KlineCopyWithImpl<$Res>
    implements $KlineCopyWith<$Res> {
  _$KlineCopyWithImpl(this._self, this._then);

  final Kline _self;
  final $Res Function(Kline) _then;

/// Create a copy of Kline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openTime = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? closePrice = null,Object? closeTime = null,}) {
  return _then(Kline(
openTime: null == openTime ? _self.openTime : openTime // ignore: cast_nullable_to_non_nullable
as DateTime,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,closePrice: null == closePrice ? _self.closePrice : closePrice // ignore: cast_nullable_to_non_nullable
as double,closeTime: null == closeTime ? _self.closeTime : closeTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


// dart format on

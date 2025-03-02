// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_exchange_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinExchangeState {

 CoinExchangeStats get exchangeStats; CoinMetadata get metadata;
/// Create a copy of CoinExchangeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinExchangeStateCopyWith<CoinExchangeState> get copyWith => _$CoinExchangeStateCopyWithImpl<CoinExchangeState>(this as CoinExchangeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinExchangeState&&(identical(other.exchangeStats, exchangeStats) || other.exchangeStats == exchangeStats)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,exchangeStats,metadata);

@override
String toString() {
  return 'CoinExchangeState(exchangeStats: $exchangeStats, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CoinExchangeStateCopyWith<$Res>  {
  factory $CoinExchangeStateCopyWith(CoinExchangeState value, $Res Function(CoinExchangeState) _then) = _$CoinExchangeStateCopyWithImpl;
@useResult
$Res call({
 CoinExchangeStats exchangeStats, CoinMetadata metadata
});




}
/// @nodoc
class _$CoinExchangeStateCopyWithImpl<$Res>
    implements $CoinExchangeStateCopyWith<$Res> {
  _$CoinExchangeStateCopyWithImpl(this._self, this._then);

  final CoinExchangeState _self;
  final $Res Function(CoinExchangeState) _then;

/// Create a copy of CoinExchangeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exchangeStats = null,Object? metadata = null,}) {
  return _then(CoinExchangeState._(
exchangeStats: null == exchangeStats ? _self.exchangeStats : exchangeStats // ignore: cast_nullable_to_non_nullable
as CoinExchangeStats,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CoinMetadata,
  ));
}

}


// dart format on

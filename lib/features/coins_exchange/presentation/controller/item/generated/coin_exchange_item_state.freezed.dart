// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_exchange_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinExchangeItemState {

 CoinExchangeStats get coinExchangeStats; CoinMetadata get metadata;
/// Create a copy of CoinExchangeItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinExchangeItemStateCopyWith<CoinExchangeItemState> get copyWith => _$CoinExchangeItemStateCopyWithImpl<CoinExchangeItemState>(this as CoinExchangeItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinExchangeItemState&&(identical(other.coinExchangeStats, coinExchangeStats) || other.coinExchangeStats == coinExchangeStats)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,coinExchangeStats,metadata);

@override
String toString() {
  return 'CoinExchangeItemState(coinExchangeStats: $coinExchangeStats, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CoinExchangeItemStateCopyWith<$Res>  {
  factory $CoinExchangeItemStateCopyWith(CoinExchangeItemState value, $Res Function(CoinExchangeItemState) _then) = _$CoinExchangeItemStateCopyWithImpl;
@useResult
$Res call({
 CoinExchangeStats coinExchangeStats, CoinMetadata metadata
});




}
/// @nodoc
class _$CoinExchangeItemStateCopyWithImpl<$Res>
    implements $CoinExchangeItemStateCopyWith<$Res> {
  _$CoinExchangeItemStateCopyWithImpl(this._self, this._then);

  final CoinExchangeItemState _self;
  final $Res Function(CoinExchangeItemState) _then;

/// Create a copy of CoinExchangeItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coinExchangeStats = null,Object? metadata = null,}) {
  return _then(CoinExchangeItemState._(
coinExchangeStats: null == coinExchangeStats ? _self.coinExchangeStats : coinExchangeStats // ignore: cast_nullable_to_non_nullable
as CoinExchangeStats,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CoinMetadata,
  ));
}

}


// dart format on

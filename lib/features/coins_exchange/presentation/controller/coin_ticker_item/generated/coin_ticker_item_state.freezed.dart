// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_ticker_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinTickerItemState {

 CoinMetadata get metadata; CoinTicker? get ticker;
/// Create a copy of CoinTickerItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinTickerItemStateCopyWith<CoinTickerItemState> get copyWith => _$CoinTickerItemStateCopyWithImpl<CoinTickerItemState>(this as CoinTickerItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinTickerItemState&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.ticker, ticker) || other.ticker == ticker));
}


@override
int get hashCode => Object.hash(runtimeType,metadata,ticker);

@override
String toString() {
  return 'CoinTickerItemState(metadata: $metadata, ticker: $ticker)';
}


}

/// @nodoc
abstract mixin class $CoinTickerItemStateCopyWith<$Res>  {
  factory $CoinTickerItemStateCopyWith(CoinTickerItemState value, $Res Function(CoinTickerItemState) _then) = _$CoinTickerItemStateCopyWithImpl;
@useResult
$Res call({
 CoinMetadata metadata, CoinTicker? ticker
});




}
/// @nodoc
class _$CoinTickerItemStateCopyWithImpl<$Res>
    implements $CoinTickerItemStateCopyWith<$Res> {
  _$CoinTickerItemStateCopyWithImpl(this._self, this._then);

  final CoinTickerItemState _self;
  final $Res Function(CoinTickerItemState) _then;

/// Create a copy of CoinTickerItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = null,Object? ticker = freezed,}) {
  return _then(CoinTickerItemState._(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CoinMetadata,ticker: freezed == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as CoinTicker?,
  ));
}

}


// dart format on

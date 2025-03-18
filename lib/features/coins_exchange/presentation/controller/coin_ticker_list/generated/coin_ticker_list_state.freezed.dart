// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_ticker_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinTickerListState {

 Map<String, CoinTicker> get tickers;
/// Create a copy of CoinTickerListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinTickerListStateCopyWith<CoinTickerListState> get copyWith => _$CoinTickerListStateCopyWithImpl<CoinTickerListState>(this as CoinTickerListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinTickerListState&&const DeepCollectionEquality().equals(other.tickers, tickers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickers));

@override
String toString() {
  return 'CoinTickerListState(tickers: $tickers)';
}


}

/// @nodoc
abstract mixin class $CoinTickerListStateCopyWith<$Res>  {
  factory $CoinTickerListStateCopyWith(CoinTickerListState value, $Res Function(CoinTickerListState) _then) = _$CoinTickerListStateCopyWithImpl;
@useResult
$Res call({
 Map<String, CoinTicker> tickers
});




}
/// @nodoc
class _$CoinTickerListStateCopyWithImpl<$Res>
    implements $CoinTickerListStateCopyWith<$Res> {
  _$CoinTickerListStateCopyWithImpl(this._self, this._then);

  final CoinTickerListState _self;
  final $Res Function(CoinTickerListState) _then;

/// Create a copy of CoinTickerListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickers = null,}) {
  return _then(CoinTickerListState._(
tickers: null == tickers ? _self.tickers : tickers // ignore: cast_nullable_to_non_nullable
as Map<String, CoinTicker>,
  ));
}

}


// dart format on

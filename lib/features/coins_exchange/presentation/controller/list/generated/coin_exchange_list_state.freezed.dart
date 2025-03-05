// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_exchange_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinExchangeListState {

 List<CoinExchangeStats> get coinsExchangeStats;
/// Create a copy of CoinExchangeListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinExchangeListStateCopyWith<CoinExchangeListState> get copyWith => _$CoinExchangeListStateCopyWithImpl<CoinExchangeListState>(this as CoinExchangeListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinExchangeListState&&const DeepCollectionEquality().equals(other.coinsExchangeStats, coinsExchangeStats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(coinsExchangeStats));

@override
String toString() {
  return 'CoinExchangeListState(coinsExchangeStats: $coinsExchangeStats)';
}


}

/// @nodoc
abstract mixin class $CoinExchangeListStateCopyWith<$Res>  {
  factory $CoinExchangeListStateCopyWith(CoinExchangeListState value, $Res Function(CoinExchangeListState) _then) = _$CoinExchangeListStateCopyWithImpl;
@useResult
$Res call({
 List<CoinExchangeStats> coinsExchangeStats
});




}
/// @nodoc
class _$CoinExchangeListStateCopyWithImpl<$Res>
    implements $CoinExchangeListStateCopyWith<$Res> {
  _$CoinExchangeListStateCopyWithImpl(this._self, this._then);

  final CoinExchangeListState _self;
  final $Res Function(CoinExchangeListState) _then;

/// Create a copy of CoinExchangeListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coinsExchangeStats = null,}) {
  return _then(CoinExchangeListState._(
coinsExchangeStats: null == coinsExchangeStats ? _self.coinsExchangeStats : coinsExchangeStats // ignore: cast_nullable_to_non_nullable
as List<CoinExchangeStats>,
  ));
}

}


// dart format on

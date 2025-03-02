// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coins_exchange_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinsExchangeState {

 CoinsExchangeStatus get status; List<CoinExchangeStats> get coinsExchangeStats;
/// Create a copy of CoinsExchangeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinsExchangeStateCopyWith<CoinsExchangeState> get copyWith => _$CoinsExchangeStateCopyWithImpl<CoinsExchangeState>(this as CoinsExchangeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinsExchangeState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.coinsExchangeStats, coinsExchangeStats));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(coinsExchangeStats));

@override
String toString() {
  return 'CoinsExchangeState(status: $status, coinsExchangeStats: $coinsExchangeStats)';
}


}

/// @nodoc
abstract mixin class $CoinsExchangeStateCopyWith<$Res>  {
  factory $CoinsExchangeStateCopyWith(CoinsExchangeState value, $Res Function(CoinsExchangeState) _then) = _$CoinsExchangeStateCopyWithImpl;
@useResult
$Res call({
 CoinsExchangeStatus status, List<CoinExchangeStats> coinsExchangeStats
});




}
/// @nodoc
class _$CoinsExchangeStateCopyWithImpl<$Res>
    implements $CoinsExchangeStateCopyWith<$Res> {
  _$CoinsExchangeStateCopyWithImpl(this._self, this._then);

  final CoinsExchangeState _self;
  final $Res Function(CoinsExchangeState) _then;

/// Create a copy of CoinsExchangeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? coinsExchangeStats = null,}) {
  return _then(CoinsExchangeState._(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoinsExchangeStatus,coinsExchangeStats: null == coinsExchangeStats ? _self.coinsExchangeStats : coinsExchangeStats // ignore: cast_nullable_to_non_nullable
as List<CoinExchangeStats>,
  ));
}

}


// dart format on

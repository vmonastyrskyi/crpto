// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../recent_trade_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecentTradeListState {

 Map<String, RecentTrade> get recentTrades;
/// Create a copy of RecentTradeListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentTradeListStateCopyWith<RecentTradeListState> get copyWith => _$RecentTradeListStateCopyWithImpl<RecentTradeListState>(this as RecentTradeListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentTradeListState&&const DeepCollectionEquality().equals(other.recentTrades, recentTrades));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recentTrades));

@override
String toString() {
  return 'RecentTradeListState(recentTrades: $recentTrades)';
}


}

/// @nodoc
abstract mixin class $RecentTradeListStateCopyWith<$Res>  {
  factory $RecentTradeListStateCopyWith(RecentTradeListState value, $Res Function(RecentTradeListState) _then) = _$RecentTradeListStateCopyWithImpl;
@useResult
$Res call({
 Map<String, RecentTrade> recentTrades
});




}
/// @nodoc
class _$RecentTradeListStateCopyWithImpl<$Res>
    implements $RecentTradeListStateCopyWith<$Res> {
  _$RecentTradeListStateCopyWithImpl(this._self, this._then);

  final RecentTradeListState _self;
  final $Res Function(RecentTradeListState) _then;

/// Create a copy of RecentTradeListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recentTrades = null,}) {
  return _then(RecentTradeListState._(
recentTrades: null == recentTrades ? _self.recentTrades : recentTrades // ignore: cast_nullable_to_non_nullable
as Map<String, RecentTrade>,
  ));
}

}


// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../recent_trade_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecentTradeItemState {

 RecentTrade? get recentTrade; CoinMetadata get metadata;
/// Create a copy of RecentTradeItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentTradeItemStateCopyWith<RecentTradeItemState> get copyWith => _$RecentTradeItemStateCopyWithImpl<RecentTradeItemState>(this as RecentTradeItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentTradeItemState&&(identical(other.recentTrade, recentTrade) || other.recentTrade == recentTrade)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,recentTrade,metadata);

@override
String toString() {
  return 'RecentTradeItemState(recentTrade: $recentTrade, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $RecentTradeItemStateCopyWith<$Res>  {
  factory $RecentTradeItemStateCopyWith(RecentTradeItemState value, $Res Function(RecentTradeItemState) _then) = _$RecentTradeItemStateCopyWithImpl;
@useResult
$Res call({
 RecentTrade? recentTrade, CoinMetadata metadata
});




}
/// @nodoc
class _$RecentTradeItemStateCopyWithImpl<$Res>
    implements $RecentTradeItemStateCopyWith<$Res> {
  _$RecentTradeItemStateCopyWithImpl(this._self, this._then);

  final RecentTradeItemState _self;
  final $Res Function(RecentTradeItemState) _then;

/// Create a copy of RecentTradeItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recentTrade = freezed,Object? metadata = null,}) {
  return _then(RecentTradeItemState._(
recentTrade: freezed == recentTrade ? _self.recentTrade : recentTrade // ignore: cast_nullable_to_non_nullable
as RecentTrade?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CoinMetadata,
  ));
}

}


// dart format on

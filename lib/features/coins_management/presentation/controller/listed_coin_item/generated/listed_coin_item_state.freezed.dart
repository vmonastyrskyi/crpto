// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coin_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListedCoinItemState {

 ListedCoin get listedCoin; CoinMetadata get metadata; bool get selected;
/// Create a copy of ListedCoinItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListedCoinItemStateCopyWith<ListedCoinItemState> get copyWith => _$ListedCoinItemStateCopyWithImpl<ListedCoinItemState>(this as ListedCoinItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListedCoinItemState&&(identical(other.listedCoin, listedCoin) || other.listedCoin == listedCoin)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode => Object.hash(runtimeType,listedCoin,metadata,selected);

@override
String toString() {
  return 'ListedCoinItemState(listedCoin: $listedCoin, metadata: $metadata, selected: $selected)';
}


}

/// @nodoc
abstract mixin class $ListedCoinItemStateCopyWith<$Res>  {
  factory $ListedCoinItemStateCopyWith(ListedCoinItemState value, $Res Function(ListedCoinItemState) _then) = _$ListedCoinItemStateCopyWithImpl;
@useResult
$Res call({
 ListedCoin listedCoin, CoinMetadata metadata, bool selected
});




}
/// @nodoc
class _$ListedCoinItemStateCopyWithImpl<$Res>
    implements $ListedCoinItemStateCopyWith<$Res> {
  _$ListedCoinItemStateCopyWithImpl(this._self, this._then);

  final ListedCoinItemState _self;
  final $Res Function(ListedCoinItemState) _then;

/// Create a copy of ListedCoinItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listedCoin = null,Object? metadata = null,Object? selected = null,}) {
  return _then(ListedCoinItemState._(
listedCoin: null == listedCoin ? _self.listedCoin : listedCoin // ignore: cast_nullable_to_non_nullable
as ListedCoin,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CoinMetadata,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on

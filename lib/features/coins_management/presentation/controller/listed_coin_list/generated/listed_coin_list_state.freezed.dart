// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coin_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListedCoinListState {

 ListedCoinsSearchStatus get searchStatus; List<ListedCoin> get listedCoins;
/// Create a copy of ListedCoinListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListedCoinListStateCopyWith<ListedCoinListState> get copyWith => _$ListedCoinListStateCopyWithImpl<ListedCoinListState>(this as ListedCoinListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListedCoinListState&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.listedCoins, listedCoins));
}


@override
int get hashCode => Object.hash(runtimeType,searchStatus,const DeepCollectionEquality().hash(listedCoins));

@override
String toString() {
  return 'ListedCoinListState(searchStatus: $searchStatus, listedCoins: $listedCoins)';
}


}

/// @nodoc
abstract mixin class $ListedCoinListStateCopyWith<$Res>  {
  factory $ListedCoinListStateCopyWith(ListedCoinListState value, $Res Function(ListedCoinListState) _then) = _$ListedCoinListStateCopyWithImpl;
@useResult
$Res call({
 ListedCoinsSearchStatus searchStatus, List<ListedCoin> listedCoins
});




}
/// @nodoc
class _$ListedCoinListStateCopyWithImpl<$Res>
    implements $ListedCoinListStateCopyWith<$Res> {
  _$ListedCoinListStateCopyWithImpl(this._self, this._then);

  final ListedCoinListState _self;
  final $Res Function(ListedCoinListState) _then;

/// Create a copy of ListedCoinListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchStatus = null,Object? listedCoins = null,}) {
  return _then(ListedCoinListState._(
searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as ListedCoinsSearchStatus,listedCoins: null == listedCoins ? _self.listedCoins : listedCoins // ignore: cast_nullable_to_non_nullable
as List<ListedCoin>,
  ));
}

}


// dart format on

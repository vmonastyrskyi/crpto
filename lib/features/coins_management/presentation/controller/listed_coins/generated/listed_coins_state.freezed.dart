// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coins_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListedCoinsState {

 ListedCoinsStatus get status; ListedCoinsSearchStatus get searchStatus; List<ListedCoin> get listedCoins;
/// Create a copy of ListedCoinsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListedCoinsStateCopyWith<ListedCoinsState> get copyWith => _$ListedCoinsStateCopyWithImpl<ListedCoinsState>(this as ListedCoinsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListedCoinsState&&(identical(other.status, status) || other.status == status)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.listedCoins, listedCoins));
}


@override
int get hashCode => Object.hash(runtimeType,status,searchStatus,const DeepCollectionEquality().hash(listedCoins));

@override
String toString() {
  return 'ListedCoinsState(status: $status, searchStatus: $searchStatus, listedCoins: $listedCoins)';
}


}

/// @nodoc
abstract mixin class $ListedCoinsStateCopyWith<$Res>  {
  factory $ListedCoinsStateCopyWith(ListedCoinsState value, $Res Function(ListedCoinsState) _then) = _$ListedCoinsStateCopyWithImpl;
@useResult
$Res call({
 ListedCoinsStatus status, ListedCoinsSearchStatus searchStatus, List<ListedCoin> listedCoins
});




}
/// @nodoc
class _$ListedCoinsStateCopyWithImpl<$Res>
    implements $ListedCoinsStateCopyWith<$Res> {
  _$ListedCoinsStateCopyWithImpl(this._self, this._then);

  final ListedCoinsState _self;
  final $Res Function(ListedCoinsState) _then;

/// Create a copy of ListedCoinsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? searchStatus = null,Object? listedCoins = null,}) {
  return _then(ListedCoinsState._(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListedCoinsStatus,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as ListedCoinsSearchStatus,listedCoins: null == listedCoins ? _self.listedCoins : listedCoins // ignore: cast_nullable_to_non_nullable
as List<ListedCoin>,
  ));
}

}


// dart format on

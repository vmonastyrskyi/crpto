// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 ListedCoinsSearchStatus get searchStatus; List<ListedCoin> get listedCoins;
/// Create a copy of ListedCoinsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListedCoinsStateCopyWith<ListedCoinsState> get copyWith => _$ListedCoinsStateCopyWithImpl<ListedCoinsState>(this as ListedCoinsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListedCoinsState&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.listedCoins, listedCoins));
}


@override
int get hashCode => Object.hash(runtimeType,searchStatus,const DeepCollectionEquality().hash(listedCoins));

@override
String toString() {
  return 'ListedCoinsState(searchStatus: $searchStatus, listedCoins: $listedCoins)';
}


}

/// @nodoc
abstract mixin class $ListedCoinsStateCopyWith<$Res>  {
  factory $ListedCoinsStateCopyWith(ListedCoinsState value, $Res Function(ListedCoinsState) _then) = _$ListedCoinsStateCopyWithImpl;
@useResult
$Res call({
 ListedCoinsSearchStatus searchStatus, List<ListedCoin> listedCoins
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
@pragma('vm:prefer-inline') @override $Res call({Object? searchStatus = null,Object? listedCoins = null,}) {
  return _then(ListedCoinsState._(
searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as ListedCoinsSearchStatus,listedCoins: null == listedCoins ? _self.listedCoins : listedCoins // ignore: cast_nullable_to_non_nullable
as List<ListedCoin>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListedCoinsState].
extension ListedCoinsStatePatterns on ListedCoinsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on

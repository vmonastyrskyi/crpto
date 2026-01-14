// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../aggregated_order_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AggregatedOrderBook {

 List<OrderBookLevelDepth> get bids; List<OrderBookLevelDepth> get asks;
/// Create a copy of AggregatedOrderBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AggregatedOrderBookCopyWith<AggregatedOrderBook> get copyWith => _$AggregatedOrderBookCopyWithImpl<AggregatedOrderBook>(this as AggregatedOrderBook, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AggregatedOrderBook&&const DeepCollectionEquality().equals(other.bids, bids)&&const DeepCollectionEquality().equals(other.asks, asks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bids),const DeepCollectionEquality().hash(asks));

@override
String toString() {
  return 'AggregatedOrderBook(bids: $bids, asks: $asks)';
}


}

/// @nodoc
abstract mixin class $AggregatedOrderBookCopyWith<$Res>  {
  factory $AggregatedOrderBookCopyWith(AggregatedOrderBook value, $Res Function(AggregatedOrderBook) _then) = _$AggregatedOrderBookCopyWithImpl;
@useResult
$Res call({
 List<OrderBookLevelDepth> bids, List<OrderBookLevelDepth> asks
});




}
/// @nodoc
class _$AggregatedOrderBookCopyWithImpl<$Res>
    implements $AggregatedOrderBookCopyWith<$Res> {
  _$AggregatedOrderBookCopyWithImpl(this._self, this._then);

  final AggregatedOrderBook _self;
  final $Res Function(AggregatedOrderBook) _then;

/// Create a copy of AggregatedOrderBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bids = null,Object? asks = null,}) {
  return _then(AggregatedOrderBook(
bids: null == bids ? _self.bids : bids // ignore: cast_nullable_to_non_nullable
as List<OrderBookLevelDepth>,asks: null == asks ? _self.asks : asks // ignore: cast_nullable_to_non_nullable
as List<OrderBookLevelDepth>,
  ));
}

}


/// Adds pattern-matching-related methods to [AggregatedOrderBook].
extension AggregatedOrderBookPatterns on AggregatedOrderBook {
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

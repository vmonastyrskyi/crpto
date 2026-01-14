// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../order_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderBook {

 List<OrderBookLevel> get bids; List<OrderBookLevel> get asks; int? get firstUpdateId; int get lastUpdateId;
/// Create a copy of OrderBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderBookCopyWith<OrderBook> get copyWith => _$OrderBookCopyWithImpl<OrderBook>(this as OrderBook, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderBook&&const DeepCollectionEquality().equals(other.bids, bids)&&const DeepCollectionEquality().equals(other.asks, asks)&&(identical(other.firstUpdateId, firstUpdateId) || other.firstUpdateId == firstUpdateId)&&(identical(other.lastUpdateId, lastUpdateId) || other.lastUpdateId == lastUpdateId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bids),const DeepCollectionEquality().hash(asks),firstUpdateId,lastUpdateId);

@override
String toString() {
  return 'OrderBook(bids: $bids, asks: $asks, firstUpdateId: $firstUpdateId, lastUpdateId: $lastUpdateId)';
}


}

/// @nodoc
abstract mixin class $OrderBookCopyWith<$Res>  {
  factory $OrderBookCopyWith(OrderBook value, $Res Function(OrderBook) _then) = _$OrderBookCopyWithImpl;
@useResult
$Res call({
 List<OrderBookLevel> bids, List<OrderBookLevel> asks, int? firstUpdateId, int lastUpdateId
});




}
/// @nodoc
class _$OrderBookCopyWithImpl<$Res>
    implements $OrderBookCopyWith<$Res> {
  _$OrderBookCopyWithImpl(this._self, this._then);

  final OrderBook _self;
  final $Res Function(OrderBook) _then;

/// Create a copy of OrderBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bids = null,Object? asks = null,Object? firstUpdateId = freezed,Object? lastUpdateId = null,}) {
  return _then(OrderBook(
bids: null == bids ? _self.bids : bids // ignore: cast_nullable_to_non_nullable
as List<OrderBookLevel>,asks: null == asks ? _self.asks : asks // ignore: cast_nullable_to_non_nullable
as List<OrderBookLevel>,firstUpdateId: freezed == firstUpdateId ? _self.firstUpdateId : firstUpdateId // ignore: cast_nullable_to_non_nullable
as int?,lastUpdateId: null == lastUpdateId ? _self.lastUpdateId : lastUpdateId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderBook].
extension OrderBookPatterns on OrderBook {
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

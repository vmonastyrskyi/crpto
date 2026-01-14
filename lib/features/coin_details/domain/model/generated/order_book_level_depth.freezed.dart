// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../order_book_level_depth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderBookLevelDepth {

 OrderBookLevel get level; double get depth;
/// Create a copy of OrderBookLevelDepth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderBookLevelDepthCopyWith<OrderBookLevelDepth> get copyWith => _$OrderBookLevelDepthCopyWithImpl<OrderBookLevelDepth>(this as OrderBookLevelDepth, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderBookLevelDepth&&(identical(other.level, level) || other.level == level)&&(identical(other.depth, depth) || other.depth == depth));
}


@override
int get hashCode => Object.hash(runtimeType,level,depth);

@override
String toString() {
  return 'OrderBookLevelDepth(level: $level, depth: $depth)';
}


}

/// @nodoc
abstract mixin class $OrderBookLevelDepthCopyWith<$Res>  {
  factory $OrderBookLevelDepthCopyWith(OrderBookLevelDepth value, $Res Function(OrderBookLevelDepth) _then) = _$OrderBookLevelDepthCopyWithImpl;
@useResult
$Res call({
 OrderBookLevel level, double depth
});




}
/// @nodoc
class _$OrderBookLevelDepthCopyWithImpl<$Res>
    implements $OrderBookLevelDepthCopyWith<$Res> {
  _$OrderBookLevelDepthCopyWithImpl(this._self, this._then);

  final OrderBookLevelDepth _self;
  final $Res Function(OrderBookLevelDepth) _then;

/// Create a copy of OrderBookLevelDepth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? depth = null,}) {
  return _then(OrderBookLevelDepth(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as OrderBookLevel,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderBookLevelDepth].
extension OrderBookLevelDepthPatterns on OrderBookLevelDepth {
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

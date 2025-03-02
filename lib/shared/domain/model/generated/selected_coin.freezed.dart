// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../selected_coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedCoin {

 String get symbol;
/// Create a copy of SelectedCoin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedCoinCopyWith<SelectedCoin> get copyWith => _$SelectedCoinCopyWithImpl<SelectedCoin>(this as SelectedCoin, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedCoin&&(identical(other.symbol, symbol) || other.symbol == symbol));
}


@override
int get hashCode => Object.hash(runtimeType,symbol);

@override
String toString() {
  return 'SelectedCoin(symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class $SelectedCoinCopyWith<$Res>  {
  factory $SelectedCoinCopyWith(SelectedCoin value, $Res Function(SelectedCoin) _then) = _$SelectedCoinCopyWithImpl;
@useResult
$Res call({
 String symbol
});




}
/// @nodoc
class _$SelectedCoinCopyWithImpl<$Res>
    implements $SelectedCoinCopyWith<$Res> {
  _$SelectedCoinCopyWithImpl(this._self, this._then);

  final SelectedCoin _self;
  final $Res Function(SelectedCoin) _then;

/// Create a copy of SelectedCoin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,}) {
  return _then(SelectedCoin(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on

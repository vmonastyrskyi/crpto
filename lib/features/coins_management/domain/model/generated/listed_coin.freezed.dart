// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListedCoin {

 String get symbol; String get baseAsset; String get quoteAsset; CoinStatus get status;
/// Create a copy of ListedCoin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListedCoinCopyWith<ListedCoin> get copyWith => _$ListedCoinCopyWithImpl<ListedCoin>(this as ListedCoin, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListedCoin&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.baseAsset, baseAsset) || other.baseAsset == baseAsset)&&(identical(other.quoteAsset, quoteAsset) || other.quoteAsset == quoteAsset)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,baseAsset,quoteAsset,status);

@override
String toString() {
  return 'ListedCoin(symbol: $symbol, baseAsset: $baseAsset, quoteAsset: $quoteAsset, status: $status)';
}


}

/// @nodoc
abstract mixin class $ListedCoinCopyWith<$Res>  {
  factory $ListedCoinCopyWith(ListedCoin value, $Res Function(ListedCoin) _then) = _$ListedCoinCopyWithImpl;
@useResult
$Res call({
 String symbol, String baseAsset, String quoteAsset, CoinStatus status
});




}
/// @nodoc
class _$ListedCoinCopyWithImpl<$Res>
    implements $ListedCoinCopyWith<$Res> {
  _$ListedCoinCopyWithImpl(this._self, this._then);

  final ListedCoin _self;
  final $Res Function(ListedCoin) _then;

/// Create a copy of ListedCoin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? baseAsset = null,Object? quoteAsset = null,Object? status = null,}) {
  return _then(ListedCoin(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,baseAsset: null == baseAsset ? _self.baseAsset : baseAsset // ignore: cast_nullable_to_non_nullable
as String,quoteAsset: null == quoteAsset ? _self.quoteAsset : quoteAsset // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoinStatus,
  ));
}

}


// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../recent_trade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecentTrade {

 int get id; String get symbol; double get price; double get quantity; TradeType get type;
/// Create a copy of RecentTrade
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentTradeCopyWith<RecentTrade> get copyWith => _$RecentTradeCopyWithImpl<RecentTrade>(this as RecentTrade, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentTrade&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,price,quantity,type);

@override
String toString() {
  return 'RecentTrade(id: $id, symbol: $symbol, price: $price, quantity: $quantity, type: $type)';
}


}

/// @nodoc
abstract mixin class $RecentTradeCopyWith<$Res>  {
  factory $RecentTradeCopyWith(RecentTrade value, $Res Function(RecentTrade) _then) = _$RecentTradeCopyWithImpl;
@useResult
$Res call({
 int id, String symbol, double price, double quantity, TradeType type
});




}
/// @nodoc
class _$RecentTradeCopyWithImpl<$Res>
    implements $RecentTradeCopyWith<$Res> {
  _$RecentTradeCopyWithImpl(this._self, this._then);

  final RecentTrade _self;
  final $Res Function(RecentTrade) _then;

/// Create a copy of RecentTrade
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? price = null,Object? quantity = null,Object? type = null,}) {
  return _then(RecentTrade(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TradeType,
  ));
}

}


// dart format on

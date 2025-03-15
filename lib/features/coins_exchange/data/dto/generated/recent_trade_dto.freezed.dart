// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../recent_trade_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecentTradeDTO {

 int get id; String get symbol; String get price; String get quantity; bool get isBuyerMaker;
/// Create a copy of RecentTradeDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentTradeDTOCopyWith<RecentTradeDTO> get copyWith => _$RecentTradeDTOCopyWithImpl<RecentTradeDTO>(this as RecentTradeDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentTradeDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isBuyerMaker, isBuyerMaker) || other.isBuyerMaker == isBuyerMaker));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,price,quantity,isBuyerMaker);

@override
String toString() {
  return 'RecentTradeDTO(id: $id, symbol: $symbol, price: $price, quantity: $quantity, isBuyerMaker: $isBuyerMaker)';
}


}

/// @nodoc
abstract mixin class $RecentTradeDTOCopyWith<$Res>  {
  factory $RecentTradeDTOCopyWith(RecentTradeDTO value, $Res Function(RecentTradeDTO) _then) = _$RecentTradeDTOCopyWithImpl;
@useResult
$Res call({
 int id, String symbol, String price, String quantity, bool isBuyerMaker
});




}
/// @nodoc
class _$RecentTradeDTOCopyWithImpl<$Res>
    implements $RecentTradeDTOCopyWith<$Res> {
  _$RecentTradeDTOCopyWithImpl(this._self, this._then);

  final RecentTradeDTO _self;
  final $Res Function(RecentTradeDTO) _then;

/// Create a copy of RecentTradeDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? price = null,Object? quantity = null,Object? isBuyerMaker = null,}) {
  return _then(RecentTradeDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,isBuyerMaker: null == isBuyerMaker ? _self.isBuyerMaker : isBuyerMaker // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on

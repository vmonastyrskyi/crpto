// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListedCoinDTO {

 String get symbol; String get baseAsset; String get quoteAsset; CoinStatus get status;
/// Create a copy of ListedCoinDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListedCoinDTOCopyWith<ListedCoinDTO> get copyWith => _$ListedCoinDTOCopyWithImpl<ListedCoinDTO>(this as ListedCoinDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListedCoinDTO&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.baseAsset, baseAsset) || other.baseAsset == baseAsset)&&(identical(other.quoteAsset, quoteAsset) || other.quoteAsset == quoteAsset)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,baseAsset,quoteAsset,status);

@override
String toString() {
  return 'ListedCoinDTO(symbol: $symbol, baseAsset: $baseAsset, quoteAsset: $quoteAsset, status: $status)';
}


}

/// @nodoc
abstract mixin class $ListedCoinDTOCopyWith<$Res>  {
  factory $ListedCoinDTOCopyWith(ListedCoinDTO value, $Res Function(ListedCoinDTO) _then) = _$ListedCoinDTOCopyWithImpl;
@useResult
$Res call({
 String symbol, String baseAsset, String quoteAsset, CoinStatus status
});




}
/// @nodoc
class _$ListedCoinDTOCopyWithImpl<$Res>
    implements $ListedCoinDTOCopyWith<$Res> {
  _$ListedCoinDTOCopyWithImpl(this._self, this._then);

  final ListedCoinDTO _self;
  final $Res Function(ListedCoinDTO) _then;

/// Create a copy of ListedCoinDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? baseAsset = null,Object? quoteAsset = null,Object? status = null,}) {
  return _then(ListedCoinDTO(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,baseAsset: null == baseAsset ? _self.baseAsset : baseAsset // ignore: cast_nullable_to_non_nullable
as String,quoteAsset: null == quoteAsset ? _self.quoteAsset : quoteAsset // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoinStatus,
  ));
}

}


// dart format on

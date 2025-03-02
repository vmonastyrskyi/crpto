// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinMetadata {

 String get symbol; String get baseAsset; String get quoteAsset; String get displayName; String get status; bool get hasIcon;
/// Create a copy of CoinMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinMetadataCopyWith<CoinMetadata> get copyWith => _$CoinMetadataCopyWithImpl<CoinMetadata>(this as CoinMetadata, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinMetadata&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.baseAsset, baseAsset) || other.baseAsset == baseAsset)&&(identical(other.quoteAsset, quoteAsset) || other.quoteAsset == quoteAsset)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasIcon, hasIcon) || other.hasIcon == hasIcon));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,baseAsset,quoteAsset,displayName,status,hasIcon);

@override
String toString() {
  return 'CoinMetadata(symbol: $symbol, baseAsset: $baseAsset, quoteAsset: $quoteAsset, displayName: $displayName, status: $status, hasIcon: $hasIcon)';
}


}

/// @nodoc
abstract mixin class $CoinMetadataCopyWith<$Res>  {
  factory $CoinMetadataCopyWith(CoinMetadata value, $Res Function(CoinMetadata) _then) = _$CoinMetadataCopyWithImpl;
@useResult
$Res call({
 String symbol, String baseAsset, String quoteAsset, String displayName, String status, bool hasIcon
});




}
/// @nodoc
class _$CoinMetadataCopyWithImpl<$Res>
    implements $CoinMetadataCopyWith<$Res> {
  _$CoinMetadataCopyWithImpl(this._self, this._then);

  final CoinMetadata _self;
  final $Res Function(CoinMetadata) _then;

/// Create a copy of CoinMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? baseAsset = null,Object? quoteAsset = null,Object? displayName = null,Object? status = null,Object? hasIcon = null,}) {
  return _then(CoinMetadata(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,baseAsset: null == baseAsset ? _self.baseAsset : baseAsset // ignore: cast_nullable_to_non_nullable
as String,quoteAsset: null == quoteAsset ? _self.quoteAsset : quoteAsset // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hasIcon: null == hasIcon ? _self.hasIcon : hasIcon // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on

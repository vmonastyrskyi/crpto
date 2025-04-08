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

 int get id; String get symbol; String get baseAsset; String get quoteAsset; String get slug; String get name; String get description; CoinCategory get category; String get logo; DateTime get dateAdded; int get rank;
/// Create a copy of CoinMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinMetadataCopyWith<CoinMetadata> get copyWith => _$CoinMetadataCopyWithImpl<CoinMetadata>(this as CoinMetadata, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinMetadata&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.baseAsset, baseAsset) || other.baseAsset == baseAsset)&&(identical(other.quoteAsset, quoteAsset) || other.quoteAsset == quoteAsset)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,baseAsset,quoteAsset,slug,name,description,category,logo,dateAdded,rank);

@override
String toString() {
  return 'CoinMetadata(id: $id, symbol: $symbol, baseAsset: $baseAsset, quoteAsset: $quoteAsset, slug: $slug, name: $name, description: $description, category: $category, logo: $logo, dateAdded: $dateAdded, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $CoinMetadataCopyWith<$Res>  {
  factory $CoinMetadataCopyWith(CoinMetadata value, $Res Function(CoinMetadata) _then) = _$CoinMetadataCopyWithImpl;
@useResult
$Res call({
 int id, String symbol, String baseAsset, String quoteAsset, String slug, String name, String description, CoinCategory category, String logo, DateTime dateAdded, int rank
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? baseAsset = null,Object? quoteAsset = null,Object? slug = null,Object? name = null,Object? description = null,Object? category = null,Object? logo = null,Object? dateAdded = null,Object? rank = null,}) {
  return _then(CoinMetadata(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,baseAsset: null == baseAsset ? _self.baseAsset : baseAsset // ignore: cast_nullable_to_non_nullable
as String,quoteAsset: null == quoteAsset ? _self.quoteAsset : quoteAsset // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CoinCategory,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on

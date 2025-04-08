// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../cmc_coin_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CmcCoinMetadata {

 int get id; String get baseAsset; String get slug; String get name; String get description; CoinCategory get category; String get logo; DateTime get dateAdded;
/// Create a copy of CmcCoinMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmcCoinMetadataCopyWith<CmcCoinMetadata> get copyWith => _$CmcCoinMetadataCopyWithImpl<CmcCoinMetadata>(this as CmcCoinMetadata, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmcCoinMetadata&&(identical(other.id, id) || other.id == id)&&(identical(other.baseAsset, baseAsset) || other.baseAsset == baseAsset)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded));
}


@override
int get hashCode => Object.hash(runtimeType,id,baseAsset,slug,name,description,category,logo,dateAdded);

@override
String toString() {
  return 'CmcCoinMetadata(id: $id, baseAsset: $baseAsset, slug: $slug, name: $name, description: $description, category: $category, logo: $logo, dateAdded: $dateAdded)';
}


}

/// @nodoc
abstract mixin class $CmcCoinMetadataCopyWith<$Res>  {
  factory $CmcCoinMetadataCopyWith(CmcCoinMetadata value, $Res Function(CmcCoinMetadata) _then) = _$CmcCoinMetadataCopyWithImpl;
@useResult
$Res call({
 int id, String baseAsset, String slug, String name, String description, CoinCategory category, String logo, DateTime dateAdded
});




}
/// @nodoc
class _$CmcCoinMetadataCopyWithImpl<$Res>
    implements $CmcCoinMetadataCopyWith<$Res> {
  _$CmcCoinMetadataCopyWithImpl(this._self, this._then);

  final CmcCoinMetadata _self;
  final $Res Function(CmcCoinMetadata) _then;

/// Create a copy of CmcCoinMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? baseAsset = null,Object? slug = null,Object? name = null,Object? description = null,Object? category = null,Object? logo = null,Object? dateAdded = null,}) {
  return _then(CmcCoinMetadata(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,baseAsset: null == baseAsset ? _self.baseAsset : baseAsset // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CoinCategory,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


// dart format on

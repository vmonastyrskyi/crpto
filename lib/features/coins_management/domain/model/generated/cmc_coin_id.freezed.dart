// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../cmc_coin_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CmcCoinId {

 int get id; String get baseAsset; String get slug; int? get rank;
/// Create a copy of CmcCoinId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmcCoinIdCopyWith<CmcCoinId> get copyWith => _$CmcCoinIdCopyWithImpl<CmcCoinId>(this as CmcCoinId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmcCoinId&&(identical(other.id, id) || other.id == id)&&(identical(other.baseAsset, baseAsset) || other.baseAsset == baseAsset)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,id,baseAsset,slug,rank);

@override
String toString() {
  return 'CmcCoinId(id: $id, baseAsset: $baseAsset, slug: $slug, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $CmcCoinIdCopyWith<$Res>  {
  factory $CmcCoinIdCopyWith(CmcCoinId value, $Res Function(CmcCoinId) _then) = _$CmcCoinIdCopyWithImpl;
@useResult
$Res call({
 int id, String baseAsset, String slug, int? rank
});




}
/// @nodoc
class _$CmcCoinIdCopyWithImpl<$Res>
    implements $CmcCoinIdCopyWith<$Res> {
  _$CmcCoinIdCopyWithImpl(this._self, this._then);

  final CmcCoinId _self;
  final $Res Function(CmcCoinId) _then;

/// Create a copy of CmcCoinId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? baseAsset = null,Object? slug = null,Object? rank = freezed,}) {
  return _then(CmcCoinId(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,baseAsset: null == baseAsset ? _self.baseAsset : baseAsset // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


// dart format on

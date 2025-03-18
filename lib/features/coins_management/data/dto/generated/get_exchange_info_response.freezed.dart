// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../get_exchange_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetExchangeInfoResponse {

 List<ListedCoinDTO> get listedCoins;
/// Create a copy of GetExchangeInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetExchangeInfoResponseCopyWith<GetExchangeInfoResponse> get copyWith => _$GetExchangeInfoResponseCopyWithImpl<GetExchangeInfoResponse>(this as GetExchangeInfoResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetExchangeInfoResponse&&const DeepCollectionEquality().equals(other.listedCoins, listedCoins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(listedCoins));

@override
String toString() {
  return 'GetExchangeInfoResponse(listedCoins: $listedCoins)';
}


}

/// @nodoc
abstract mixin class $GetExchangeInfoResponseCopyWith<$Res>  {
  factory $GetExchangeInfoResponseCopyWith(GetExchangeInfoResponse value, $Res Function(GetExchangeInfoResponse) _then) = _$GetExchangeInfoResponseCopyWithImpl;
@useResult
$Res call({
 List<ListedCoinDTO> listedCoins
});




}
/// @nodoc
class _$GetExchangeInfoResponseCopyWithImpl<$Res>
    implements $GetExchangeInfoResponseCopyWith<$Res> {
  _$GetExchangeInfoResponseCopyWithImpl(this._self, this._then);

  final GetExchangeInfoResponse _self;
  final $Res Function(GetExchangeInfoResponse) _then;

/// Create a copy of GetExchangeInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listedCoins = null,}) {
  return _then(GetExchangeInfoResponse(
listedCoins: null == listedCoins ? _self.listedCoins : listedCoins // ignore: cast_nullable_to_non_nullable
as List<ListedCoinDTO>,
  ));
}

}


// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_kline_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinKlineListState {

 List<Kline> get klines;
/// Create a copy of CoinKlineListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinKlineListStateCopyWith<CoinKlineListState> get copyWith => _$CoinKlineListStateCopyWithImpl<CoinKlineListState>(this as CoinKlineListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinKlineListState&&const DeepCollectionEquality().equals(other.klines, klines));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(klines));

@override
String toString() {
  return 'CoinKlineListState(klines: $klines)';
}


}

/// @nodoc
abstract mixin class $CoinKlineListStateCopyWith<$Res>  {
  factory $CoinKlineListStateCopyWith(CoinKlineListState value, $Res Function(CoinKlineListState) _then) = _$CoinKlineListStateCopyWithImpl;
@useResult
$Res call({
 List<Kline> klines
});




}
/// @nodoc
class _$CoinKlineListStateCopyWithImpl<$Res>
    implements $CoinKlineListStateCopyWith<$Res> {
  _$CoinKlineListStateCopyWithImpl(this._self, this._then);

  final CoinKlineListState _self;
  final $Res Function(CoinKlineListState) _then;

/// Create a copy of CoinKlineListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? klines = null,}) {
  return _then(CoinKlineListState._(
klines: null == klines ? _self.klines : klines // ignore: cast_nullable_to_non_nullable
as List<Kline>,
  ));
}

}


// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../get_exchange_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetExchangeInfoResponse _$GetExchangeInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _GetExchangeInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$GetExchangeInfoResponse {
  @JsonKey(name: 'symbols')
  List<ListedCoinDTO> get listedCoins => throw _privateConstructorUsedError;

  /// Serializes this GetExchangeInfoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetExchangeInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetExchangeInfoResponseCopyWith<GetExchangeInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExchangeInfoResponseCopyWith<$Res> {
  factory $GetExchangeInfoResponseCopyWith(GetExchangeInfoResponse value,
          $Res Function(GetExchangeInfoResponse) then) =
      _$GetExchangeInfoResponseCopyWithImpl<$Res, GetExchangeInfoResponse>;
  @useResult
  $Res call({@JsonKey(name: 'symbols') List<ListedCoinDTO> listedCoins});
}

/// @nodoc
class _$GetExchangeInfoResponseCopyWithImpl<$Res,
        $Val extends GetExchangeInfoResponse>
    implements $GetExchangeInfoResponseCopyWith<$Res> {
  _$GetExchangeInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetExchangeInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listedCoins = null,
  }) {
    return _then(_value.copyWith(
      listedCoins: null == listedCoins
          ? _value.listedCoins
          : listedCoins // ignore: cast_nullable_to_non_nullable
              as List<ListedCoinDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetExchangeInfoResponseImplCopyWith<$Res>
    implements $GetExchangeInfoResponseCopyWith<$Res> {
  factory _$$GetExchangeInfoResponseImplCopyWith(
          _$GetExchangeInfoResponseImpl value,
          $Res Function(_$GetExchangeInfoResponseImpl) then) =
      __$$GetExchangeInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'symbols') List<ListedCoinDTO> listedCoins});
}

/// @nodoc
class __$$GetExchangeInfoResponseImplCopyWithImpl<$Res>
    extends _$GetExchangeInfoResponseCopyWithImpl<$Res,
        _$GetExchangeInfoResponseImpl>
    implements _$$GetExchangeInfoResponseImplCopyWith<$Res> {
  __$$GetExchangeInfoResponseImplCopyWithImpl(
      _$GetExchangeInfoResponseImpl _value,
      $Res Function(_$GetExchangeInfoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetExchangeInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listedCoins = null,
  }) {
    return _then(_$GetExchangeInfoResponseImpl(
      listedCoins: null == listedCoins
          ? _value._listedCoins
          : listedCoins // ignore: cast_nullable_to_non_nullable
              as List<ListedCoinDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetExchangeInfoResponseImpl implements _GetExchangeInfoResponse {
  _$GetExchangeInfoResponseImpl(
      {@JsonKey(name: 'symbols')
      required final List<ListedCoinDTO> listedCoins})
      : _listedCoins = listedCoins;

  factory _$GetExchangeInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetExchangeInfoResponseImplFromJson(json);

  final List<ListedCoinDTO> _listedCoins;
  @override
  @JsonKey(name: 'symbols')
  List<ListedCoinDTO> get listedCoins {
    if (_listedCoins is EqualUnmodifiableListView) return _listedCoins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listedCoins);
  }

  @override
  String toString() {
    return 'GetExchangeInfoResponse(listedCoins: $listedCoins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExchangeInfoResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._listedCoins, _listedCoins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listedCoins));

  /// Create a copy of GetExchangeInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExchangeInfoResponseImplCopyWith<_$GetExchangeInfoResponseImpl>
      get copyWith => __$$GetExchangeInfoResponseImplCopyWithImpl<
          _$GetExchangeInfoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetExchangeInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _GetExchangeInfoResponse implements GetExchangeInfoResponse {
  factory _GetExchangeInfoResponse(
          {@JsonKey(name: 'symbols')
          required final List<ListedCoinDTO> listedCoins}) =
      _$GetExchangeInfoResponseImpl;

  factory _GetExchangeInfoResponse.fromJson(Map<String, dynamic> json) =
      _$GetExchangeInfoResponseImpl.fromJson;

  @override
  @JsonKey(name: 'symbols')
  List<ListedCoinDTO> get listedCoins;

  /// Create a copy of GetExchangeInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetExchangeInfoResponseImplCopyWith<_$GetExchangeInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

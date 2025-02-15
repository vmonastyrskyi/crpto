// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListedCoinDTO _$ListedCoinDTOFromJson(Map<String, dynamic> json) {
  return _ListedCoinDTO.fromJson(json);
}

/// @nodoc
mixin _$ListedCoinDTO {
  @JsonKey(name: 'symbol')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'baseAsset')
  String get baseAsset => throw _privateConstructorUsedError;
  @JsonKey(name: 'quoteAsset')
  String get quoteAsset => throw _privateConstructorUsedError;

  /// Serializes this ListedCoinDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListedCoinDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListedCoinDTOCopyWith<ListedCoinDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListedCoinDTOCopyWith<$Res> {
  factory $ListedCoinDTOCopyWith(
          ListedCoinDTO value, $Res Function(ListedCoinDTO) then) =
      _$ListedCoinDTOCopyWithImpl<$Res, ListedCoinDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'symbol') String id,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'baseAsset') String baseAsset,
      @JsonKey(name: 'quoteAsset') String quoteAsset});
}

/// @nodoc
class _$ListedCoinDTOCopyWithImpl<$Res, $Val extends ListedCoinDTO>
    implements $ListedCoinDTOCopyWith<$Res> {
  _$ListedCoinDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListedCoinDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? baseAsset = null,
    Object? quoteAsset = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      baseAsset: null == baseAsset
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as String,
      quoteAsset: null == quoteAsset
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListedCoinDTOImplCopyWith<$Res>
    implements $ListedCoinDTOCopyWith<$Res> {
  factory _$$ListedCoinDTOImplCopyWith(
          _$ListedCoinDTOImpl value, $Res Function(_$ListedCoinDTOImpl) then) =
      __$$ListedCoinDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'symbol') String id,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'baseAsset') String baseAsset,
      @JsonKey(name: 'quoteAsset') String quoteAsset});
}

/// @nodoc
class __$$ListedCoinDTOImplCopyWithImpl<$Res>
    extends _$ListedCoinDTOCopyWithImpl<$Res, _$ListedCoinDTOImpl>
    implements _$$ListedCoinDTOImplCopyWith<$Res> {
  __$$ListedCoinDTOImplCopyWithImpl(
      _$ListedCoinDTOImpl _value, $Res Function(_$ListedCoinDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListedCoinDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? baseAsset = null,
    Object? quoteAsset = null,
  }) {
    return _then(_$ListedCoinDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      baseAsset: null == baseAsset
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as String,
      quoteAsset: null == quoteAsset
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListedCoinDTOImpl implements _ListedCoinDTO {
  _$ListedCoinDTOImpl(
      {@JsonKey(name: 'symbol') required this.id,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'baseAsset') required this.baseAsset,
      @JsonKey(name: 'quoteAsset') required this.quoteAsset});

  factory _$ListedCoinDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListedCoinDTOImplFromJson(json);

  @override
  @JsonKey(name: 'symbol')
  final String id;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'baseAsset')
  final String baseAsset;
  @override
  @JsonKey(name: 'quoteAsset')
  final String quoteAsset;

  @override
  String toString() {
    return 'ListedCoinDTO(id: $id, status: $status, baseAsset: $baseAsset, quoteAsset: $quoteAsset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListedCoinDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.baseAsset, baseAsset) ||
                other.baseAsset == baseAsset) &&
            (identical(other.quoteAsset, quoteAsset) ||
                other.quoteAsset == quoteAsset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, baseAsset, quoteAsset);

  /// Create a copy of ListedCoinDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListedCoinDTOImplCopyWith<_$ListedCoinDTOImpl> get copyWith =>
      __$$ListedCoinDTOImplCopyWithImpl<_$ListedCoinDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListedCoinDTOImplToJson(
      this,
    );
  }
}

abstract class _ListedCoinDTO implements ListedCoinDTO {
  factory _ListedCoinDTO(
          {@JsonKey(name: 'symbol') required final String id,
          @JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'baseAsset') required final String baseAsset,
          @JsonKey(name: 'quoteAsset') required final String quoteAsset}) =
      _$ListedCoinDTOImpl;

  factory _ListedCoinDTO.fromJson(Map<String, dynamic> json) =
      _$ListedCoinDTOImpl.fromJson;

  @override
  @JsonKey(name: 'symbol')
  String get id;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'baseAsset')
  String get baseAsset;
  @override
  @JsonKey(name: 'quoteAsset')
  String get quoteAsset;

  /// Create a copy of ListedCoinDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListedCoinDTOImplCopyWith<_$ListedCoinDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

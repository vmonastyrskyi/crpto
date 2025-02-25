// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CoinMetadata {
  String get symbol => throw _privateConstructorUsedError;
  String get baseAsset => throw _privateConstructorUsedError;
  String get quoteAsset => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get hasIcon => throw _privateConstructorUsedError;

  /// Create a copy of CoinMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinMetadataCopyWith<CoinMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinMetadataCopyWith<$Res> {
  factory $CoinMetadataCopyWith(
    CoinMetadata value,
    $Res Function(CoinMetadata) then,
  ) = _$CoinMetadataCopyWithImpl<$Res, CoinMetadata>;
  @useResult
  $Res call({
    String symbol,
    String baseAsset,
    String quoteAsset,
    String displayName,
    String status,
    bool hasIcon,
  });
}

/// @nodoc
class _$CoinMetadataCopyWithImpl<$Res, $Val extends CoinMetadata>
    implements $CoinMetadataCopyWith<$Res> {
  _$CoinMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? baseAsset = null,
    Object? quoteAsset = null,
    Object? displayName = null,
    Object? status = null,
    Object? hasIcon = null,
  }) {
    return _then(
      _value.copyWith(
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            baseAsset:
                null == baseAsset
                    ? _value.baseAsset
                    : baseAsset // ignore: cast_nullable_to_non_nullable
                        as String,
            quoteAsset:
                null == quoteAsset
                    ? _value.quoteAsset
                    : quoteAsset // ignore: cast_nullable_to_non_nullable
                        as String,
            displayName:
                null == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            hasIcon:
                null == hasIcon
                    ? _value.hasIcon
                    : hasIcon // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoinMetadataImplCopyWith<$Res>
    implements $CoinMetadataCopyWith<$Res> {
  factory _$$CoinMetadataImplCopyWith(
    _$CoinMetadataImpl value,
    $Res Function(_$CoinMetadataImpl) then,
  ) = __$$CoinMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String symbol,
    String baseAsset,
    String quoteAsset,
    String displayName,
    String status,
    bool hasIcon,
  });
}

/// @nodoc
class __$$CoinMetadataImplCopyWithImpl<$Res>
    extends _$CoinMetadataCopyWithImpl<$Res, _$CoinMetadataImpl>
    implements _$$CoinMetadataImplCopyWith<$Res> {
  __$$CoinMetadataImplCopyWithImpl(
    _$CoinMetadataImpl _value,
    $Res Function(_$CoinMetadataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoinMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? baseAsset = null,
    Object? quoteAsset = null,
    Object? displayName = null,
    Object? status = null,
    Object? hasIcon = null,
  }) {
    return _then(
      _$CoinMetadataImpl(
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        baseAsset:
            null == baseAsset
                ? _value.baseAsset
                : baseAsset // ignore: cast_nullable_to_non_nullable
                    as String,
        quoteAsset:
            null == quoteAsset
                ? _value.quoteAsset
                : quoteAsset // ignore: cast_nullable_to_non_nullable
                    as String,
        displayName:
            null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        hasIcon:
            null == hasIcon
                ? _value.hasIcon
                : hasIcon // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$CoinMetadataImpl implements _CoinMetadata {
  _$CoinMetadataImpl({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.displayName,
    required this.status,
    required this.hasIcon,
  });

  @override
  final String symbol;
  @override
  final String baseAsset;
  @override
  final String quoteAsset;
  @override
  final String displayName;
  @override
  final String status;
  @override
  final bool hasIcon;

  @override
  String toString() {
    return 'CoinMetadata(symbol: $symbol, baseAsset: $baseAsset, quoteAsset: $quoteAsset, displayName: $displayName, status: $status, hasIcon: $hasIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinMetadataImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.baseAsset, baseAsset) ||
                other.baseAsset == baseAsset) &&
            (identical(other.quoteAsset, quoteAsset) ||
                other.quoteAsset == quoteAsset) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hasIcon, hasIcon) || other.hasIcon == hasIcon));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    symbol,
    baseAsset,
    quoteAsset,
    displayName,
    status,
    hasIcon,
  );

  /// Create a copy of CoinMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinMetadataImplCopyWith<_$CoinMetadataImpl> get copyWith =>
      __$$CoinMetadataImplCopyWithImpl<_$CoinMetadataImpl>(this, _$identity);
}

abstract class _CoinMetadata implements CoinMetadata {
  factory _CoinMetadata({
    required final String symbol,
    required final String baseAsset,
    required final String quoteAsset,
    required final String displayName,
    required final String status,
    required final bool hasIcon,
  }) = _$CoinMetadataImpl;

  @override
  String get symbol;
  @override
  String get baseAsset;
  @override
  String get quoteAsset;
  @override
  String get displayName;
  @override
  String get status;
  @override
  bool get hasIcon;

  /// Create a copy of CoinMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinMetadataImplCopyWith<_$CoinMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coin_exchange_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CoinExchangeState {
  CoinExchangeStats get exchangeStats => throw _privateConstructorUsedError;
  CoinMetadata get metadata => throw _privateConstructorUsedError;

  /// Create a copy of CoinExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinExchangeStateCopyWith<CoinExchangeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinExchangeStateCopyWith<$Res> {
  factory $CoinExchangeStateCopyWith(
    CoinExchangeState value,
    $Res Function(CoinExchangeState) then,
  ) = _$CoinExchangeStateCopyWithImpl<$Res, CoinExchangeState>;
  @useResult
  $Res call({CoinExchangeStats exchangeStats, CoinMetadata metadata});

  $CoinExchangeStatsCopyWith<$Res> get exchangeStats;
  $CoinMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$CoinExchangeStateCopyWithImpl<$Res, $Val extends CoinExchangeState>
    implements $CoinExchangeStateCopyWith<$Res> {
  _$CoinExchangeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exchangeStats = null, Object? metadata = null}) {
    return _then(
      _value.copyWith(
            exchangeStats:
                null == exchangeStats
                    ? _value.exchangeStats
                    : exchangeStats // ignore: cast_nullable_to_non_nullable
                        as CoinExchangeStats,
            metadata:
                null == metadata
                    ? _value.metadata
                    : metadata // ignore: cast_nullable_to_non_nullable
                        as CoinMetadata,
          )
          as $Val,
    );
  }

  /// Create a copy of CoinExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoinExchangeStatsCopyWith<$Res> get exchangeStats {
    return $CoinExchangeStatsCopyWith<$Res>(_value.exchangeStats, (value) {
      return _then(_value.copyWith(exchangeStats: value) as $Val);
    });
  }

  /// Create a copy of CoinExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoinMetadataCopyWith<$Res> get metadata {
    return $CoinMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoinExchangeStateImplCopyWith<$Res>
    implements $CoinExchangeStateCopyWith<$Res> {
  factory _$$CoinExchangeStateImplCopyWith(
    _$CoinExchangeStateImpl value,
    $Res Function(_$CoinExchangeStateImpl) then,
  ) = __$$CoinExchangeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CoinExchangeStats exchangeStats, CoinMetadata metadata});

  @override
  $CoinExchangeStatsCopyWith<$Res> get exchangeStats;
  @override
  $CoinMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$CoinExchangeStateImplCopyWithImpl<$Res>
    extends _$CoinExchangeStateCopyWithImpl<$Res, _$CoinExchangeStateImpl>
    implements _$$CoinExchangeStateImplCopyWith<$Res> {
  __$$CoinExchangeStateImplCopyWithImpl(
    _$CoinExchangeStateImpl _value,
    $Res Function(_$CoinExchangeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoinExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exchangeStats = null, Object? metadata = null}) {
    return _then(
      _$CoinExchangeStateImpl(
        exchangeStats:
            null == exchangeStats
                ? _value.exchangeStats
                : exchangeStats // ignore: cast_nullable_to_non_nullable
                    as CoinExchangeStats,
        metadata:
            null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                    as CoinMetadata,
      ),
    );
  }
}

/// @nodoc

class _$CoinExchangeStateImpl implements _CoinExchangeState {
  const _$CoinExchangeStateImpl({
    required this.exchangeStats,
    required this.metadata,
  });

  @override
  final CoinExchangeStats exchangeStats;
  @override
  final CoinMetadata metadata;

  @override
  String toString() {
    return 'CoinExchangeState(exchangeStats: $exchangeStats, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinExchangeStateImpl &&
            (identical(other.exchangeStats, exchangeStats) ||
                other.exchangeStats == exchangeStats) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exchangeStats, metadata);

  /// Create a copy of CoinExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinExchangeStateImplCopyWith<_$CoinExchangeStateImpl> get copyWith =>
      __$$CoinExchangeStateImplCopyWithImpl<_$CoinExchangeStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CoinExchangeState implements CoinExchangeState {
  const factory _CoinExchangeState({
    required final CoinExchangeStats exchangeStats,
    required final CoinMetadata metadata,
  }) = _$CoinExchangeStateImpl;

  @override
  CoinExchangeStats get exchangeStats;
  @override
  CoinMetadata get metadata;

  /// Create a copy of CoinExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinExchangeStateImplCopyWith<_$CoinExchangeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

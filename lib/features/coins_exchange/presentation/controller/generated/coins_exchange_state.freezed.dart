// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../coins_exchange_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CoinsExchangeState {
  CoinsExchangeStatus get status => throw _privateConstructorUsedError;
  List<CoinExchangeStats> get coinsExchangeStats =>
      throw _privateConstructorUsedError;

  /// Create a copy of CoinsExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinsExchangeStateCopyWith<CoinsExchangeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinsExchangeStateCopyWith<$Res> {
  factory $CoinsExchangeStateCopyWith(
    CoinsExchangeState value,
    $Res Function(CoinsExchangeState) then,
  ) = _$CoinsExchangeStateCopyWithImpl<$Res, CoinsExchangeState>;
  @useResult
  $Res call({
    CoinsExchangeStatus status,
    List<CoinExchangeStats> coinsExchangeStats,
  });
}

/// @nodoc
class _$CoinsExchangeStateCopyWithImpl<$Res, $Val extends CoinsExchangeState>
    implements $CoinsExchangeStateCopyWith<$Res> {
  _$CoinsExchangeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinsExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? coinsExchangeStats = null}) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as CoinsExchangeStatus,
            coinsExchangeStats:
                null == coinsExchangeStats
                    ? _value.coinsExchangeStats
                    : coinsExchangeStats // ignore: cast_nullable_to_non_nullable
                        as List<CoinExchangeStats>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoinsExchangeStateImplCopyWith<$Res>
    implements $CoinsExchangeStateCopyWith<$Res> {
  factory _$$CoinsExchangeStateImplCopyWith(
    _$CoinsExchangeStateImpl value,
    $Res Function(_$CoinsExchangeStateImpl) then,
  ) = __$$CoinsExchangeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CoinsExchangeStatus status,
    List<CoinExchangeStats> coinsExchangeStats,
  });
}

/// @nodoc
class __$$CoinsExchangeStateImplCopyWithImpl<$Res>
    extends _$CoinsExchangeStateCopyWithImpl<$Res, _$CoinsExchangeStateImpl>
    implements _$$CoinsExchangeStateImplCopyWith<$Res> {
  __$$CoinsExchangeStateImplCopyWithImpl(
    _$CoinsExchangeStateImpl _value,
    $Res Function(_$CoinsExchangeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoinsExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? coinsExchangeStats = null}) {
    return _then(
      _$CoinsExchangeStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as CoinsExchangeStatus,
        coinsExchangeStats:
            null == coinsExchangeStats
                ? _value._coinsExchangeStats
                : coinsExchangeStats // ignore: cast_nullable_to_non_nullable
                    as List<CoinExchangeStats>,
      ),
    );
  }
}

/// @nodoc

class _$CoinsExchangeStateImpl implements _CoinsExchangeState {
  const _$CoinsExchangeStateImpl({
    required this.status,
    required final List<CoinExchangeStats> coinsExchangeStats,
  }) : _coinsExchangeStats = coinsExchangeStats;

  @override
  final CoinsExchangeStatus status;
  final List<CoinExchangeStats> _coinsExchangeStats;
  @override
  List<CoinExchangeStats> get coinsExchangeStats {
    if (_coinsExchangeStats is EqualUnmodifiableListView)
      return _coinsExchangeStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coinsExchangeStats);
  }

  @override
  String toString() {
    return 'CoinsExchangeState(status: $status, coinsExchangeStats: $coinsExchangeStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinsExchangeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._coinsExchangeStats,
              _coinsExchangeStats,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_coinsExchangeStats),
  );

  /// Create a copy of CoinsExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinsExchangeStateImplCopyWith<_$CoinsExchangeStateImpl> get copyWith =>
      __$$CoinsExchangeStateImplCopyWithImpl<_$CoinsExchangeStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CoinsExchangeState implements CoinsExchangeState {
  const factory _CoinsExchangeState({
    required final CoinsExchangeStatus status,
    required final List<CoinExchangeStats> coinsExchangeStats,
  }) = _$CoinsExchangeStateImpl;

  @override
  CoinsExchangeStatus get status;
  @override
  List<CoinExchangeStats> get coinsExchangeStats;

  /// Create a copy of CoinsExchangeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinsExchangeStateImplCopyWith<_$CoinsExchangeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

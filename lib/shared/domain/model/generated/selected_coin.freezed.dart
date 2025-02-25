// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../selected_coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SelectedCoin {
  String get symbol => throw _privateConstructorUsedError;

  /// Create a copy of SelectedCoin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedCoinCopyWith<SelectedCoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedCoinCopyWith<$Res> {
  factory $SelectedCoinCopyWith(
    SelectedCoin value,
    $Res Function(SelectedCoin) then,
  ) = _$SelectedCoinCopyWithImpl<$Res, SelectedCoin>;
  @useResult
  $Res call({String symbol});
}

/// @nodoc
class _$SelectedCoinCopyWithImpl<$Res, $Val extends SelectedCoin>
    implements $SelectedCoinCopyWith<$Res> {
  _$SelectedCoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedCoin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? symbol = null}) {
    return _then(
      _value.copyWith(
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SelectedCoinImplCopyWith<$Res>
    implements $SelectedCoinCopyWith<$Res> {
  factory _$$SelectedCoinImplCopyWith(
    _$SelectedCoinImpl value,
    $Res Function(_$SelectedCoinImpl) then,
  ) = __$$SelectedCoinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String symbol});
}

/// @nodoc
class __$$SelectedCoinImplCopyWithImpl<$Res>
    extends _$SelectedCoinCopyWithImpl<$Res, _$SelectedCoinImpl>
    implements _$$SelectedCoinImplCopyWith<$Res> {
  __$$SelectedCoinImplCopyWithImpl(
    _$SelectedCoinImpl _value,
    $Res Function(_$SelectedCoinImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SelectedCoin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? symbol = null}) {
    return _then(
      _$SelectedCoinImpl(
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectedCoinImpl implements _SelectedCoin {
  _$SelectedCoinImpl({required this.symbol});

  @override
  final String symbol;

  @override
  String toString() {
    return 'SelectedCoin(symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedCoinImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode => Object.hash(runtimeType, symbol);

  /// Create a copy of SelectedCoin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedCoinImplCopyWith<_$SelectedCoinImpl> get copyWith =>
      __$$SelectedCoinImplCopyWithImpl<_$SelectedCoinImpl>(this, _$identity);
}

abstract class _SelectedCoin implements SelectedCoin {
  factory _SelectedCoin({required final String symbol}) = _$SelectedCoinImpl;

  @override
  String get symbol;

  /// Create a copy of SelectedCoin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedCoinImplCopyWith<_$SelectedCoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

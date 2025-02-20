// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ListedCoin {
  String get symbol => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get baseAsset => throw _privateConstructorUsedError;
  String get quoteAsset => throw _privateConstructorUsedError;
  bool get hasIcon => throw _privateConstructorUsedError;

  /// Create a copy of ListedCoin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListedCoinCopyWith<ListedCoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListedCoinCopyWith<$Res> {
  factory $ListedCoinCopyWith(
    ListedCoin value,
    $Res Function(ListedCoin) then,
  ) = _$ListedCoinCopyWithImpl<$Res, ListedCoin>;
  @useResult
  $Res call({
    String symbol,
    String status,
    String baseAsset,
    String quoteAsset,
    bool hasIcon,
  });
}

/// @nodoc
class _$ListedCoinCopyWithImpl<$Res, $Val extends ListedCoin>
    implements $ListedCoinCopyWith<$Res> {
  _$ListedCoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListedCoin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? status = null,
    Object? baseAsset = null,
    Object? quoteAsset = null,
    Object? hasIcon = null,
  }) {
    return _then(
      _value.copyWith(
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ListedCoinImplCopyWith<$Res>
    implements $ListedCoinCopyWith<$Res> {
  factory _$$ListedCoinImplCopyWith(
    _$ListedCoinImpl value,
    $Res Function(_$ListedCoinImpl) then,
  ) = __$$ListedCoinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String symbol,
    String status,
    String baseAsset,
    String quoteAsset,
    bool hasIcon,
  });
}

/// @nodoc
class __$$ListedCoinImplCopyWithImpl<$Res>
    extends _$ListedCoinCopyWithImpl<$Res, _$ListedCoinImpl>
    implements _$$ListedCoinImplCopyWith<$Res> {
  __$$ListedCoinImplCopyWithImpl(
    _$ListedCoinImpl _value,
    $Res Function(_$ListedCoinImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListedCoin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? status = null,
    Object? baseAsset = null,
    Object? quoteAsset = null,
    Object? hasIcon = null,
  }) {
    return _then(
      _$ListedCoinImpl(
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
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

class _$ListedCoinImpl implements _ListedCoin {
  _$ListedCoinImpl({
    required this.symbol,
    required this.status,
    required this.baseAsset,
    required this.quoteAsset,
    this.hasIcon = false,
  });

  @override
  final String symbol;
  @override
  final String status;
  @override
  final String baseAsset;
  @override
  final String quoteAsset;
  @override
  @JsonKey()
  final bool hasIcon;

  @override
  String toString() {
    return 'ListedCoin(symbol: $symbol, status: $status, baseAsset: $baseAsset, quoteAsset: $quoteAsset, hasIcon: $hasIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListedCoinImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.baseAsset, baseAsset) ||
                other.baseAsset == baseAsset) &&
            (identical(other.quoteAsset, quoteAsset) ||
                other.quoteAsset == quoteAsset) &&
            (identical(other.hasIcon, hasIcon) || other.hasIcon == hasIcon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, symbol, status, baseAsset, quoteAsset, hasIcon);

  /// Create a copy of ListedCoin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListedCoinImplCopyWith<_$ListedCoinImpl> get copyWith =>
      __$$ListedCoinImplCopyWithImpl<_$ListedCoinImpl>(this, _$identity);
}

abstract class _ListedCoin implements ListedCoin {
  factory _ListedCoin({
    required final String symbol,
    required final String status,
    required final String baseAsset,
    required final String quoteAsset,
    final bool hasIcon,
  }) = _$ListedCoinImpl;

  @override
  String get symbol;
  @override
  String get status;
  @override
  String get baseAsset;
  @override
  String get quoteAsset;
  @override
  bool get hasIcon;

  /// Create a copy of ListedCoin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListedCoinImplCopyWith<_$ListedCoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../listed_coins_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListedCoinsState {
  ListedCoinsStatus get status => throw _privateConstructorUsedError;
  ListedCoinsSearchStatus get searchStatus =>
      throw _privateConstructorUsedError;
  List<ListedCoin> get listedCoins => throw _privateConstructorUsedError;

  /// Create a copy of ListedCoinsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListedCoinsStateCopyWith<ListedCoinsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListedCoinsStateCopyWith<$Res> {
  factory $ListedCoinsStateCopyWith(
          ListedCoinsState value, $Res Function(ListedCoinsState) then) =
      _$ListedCoinsStateCopyWithImpl<$Res, ListedCoinsState>;
  @useResult
  $Res call(
      {ListedCoinsStatus status,
      ListedCoinsSearchStatus searchStatus,
      List<ListedCoin> listedCoins});
}

/// @nodoc
class _$ListedCoinsStateCopyWithImpl<$Res, $Val extends ListedCoinsState>
    implements $ListedCoinsStateCopyWith<$Res> {
  _$ListedCoinsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListedCoinsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? searchStatus = null,
    Object? listedCoins = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListedCoinsStatus,
      searchStatus: null == searchStatus
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as ListedCoinsSearchStatus,
      listedCoins: null == listedCoins
          ? _value.listedCoins
          : listedCoins // ignore: cast_nullable_to_non_nullable
              as List<ListedCoin>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListedCoinsStateImplCopyWith<$Res>
    implements $ListedCoinsStateCopyWith<$Res> {
  factory _$$ListedCoinsStateImplCopyWith(_$ListedCoinsStateImpl value,
          $Res Function(_$ListedCoinsStateImpl) then) =
      __$$ListedCoinsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ListedCoinsStatus status,
      ListedCoinsSearchStatus searchStatus,
      List<ListedCoin> listedCoins});
}

/// @nodoc
class __$$ListedCoinsStateImplCopyWithImpl<$Res>
    extends _$ListedCoinsStateCopyWithImpl<$Res, _$ListedCoinsStateImpl>
    implements _$$ListedCoinsStateImplCopyWith<$Res> {
  __$$ListedCoinsStateImplCopyWithImpl(_$ListedCoinsStateImpl _value,
      $Res Function(_$ListedCoinsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListedCoinsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? searchStatus = null,
    Object? listedCoins = null,
  }) {
    return _then(_$ListedCoinsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListedCoinsStatus,
      searchStatus: null == searchStatus
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as ListedCoinsSearchStatus,
      listedCoins: null == listedCoins
          ? _value._listedCoins
          : listedCoins // ignore: cast_nullable_to_non_nullable
              as List<ListedCoin>,
    ));
  }
}

/// @nodoc

class _$ListedCoinsStateImpl implements _ListedCoinsState {
  const _$ListedCoinsStateImpl(
      {required this.status,
      required this.searchStatus,
      required final List<ListedCoin> listedCoins})
      : _listedCoins = listedCoins;

  @override
  final ListedCoinsStatus status;
  @override
  final ListedCoinsSearchStatus searchStatus;
  final List<ListedCoin> _listedCoins;
  @override
  List<ListedCoin> get listedCoins {
    if (_listedCoins is EqualUnmodifiableListView) return _listedCoins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listedCoins);
  }

  @override
  String toString() {
    return 'ListedCoinsState(status: $status, searchStatus: $searchStatus, listedCoins: $listedCoins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListedCoinsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.searchStatus, searchStatus) ||
                other.searchStatus == searchStatus) &&
            const DeepCollectionEquality()
                .equals(other._listedCoins, _listedCoins));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, searchStatus,
      const DeepCollectionEquality().hash(_listedCoins));

  /// Create a copy of ListedCoinsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListedCoinsStateImplCopyWith<_$ListedCoinsStateImpl> get copyWith =>
      __$$ListedCoinsStateImplCopyWithImpl<_$ListedCoinsStateImpl>(
          this, _$identity);
}

abstract class _ListedCoinsState implements ListedCoinsState {
  const factory _ListedCoinsState(
      {required final ListedCoinsStatus status,
      required final ListedCoinsSearchStatus searchStatus,
      required final List<ListedCoin> listedCoins}) = _$ListedCoinsStateImpl;

  @override
  ListedCoinsStatus get status;
  @override
  ListedCoinsSearchStatus get searchStatus;
  @override
  List<ListedCoin> get listedCoins;

  /// Create a copy of ListedCoinsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListedCoinsStateImplCopyWith<_$ListedCoinsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

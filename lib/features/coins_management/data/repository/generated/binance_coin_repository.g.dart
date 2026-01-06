// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../binance_coin_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinanceCoinRepository)
const binanceCoinRepositoryProvider = BinanceCoinRepositoryProvider._();

final class BinanceCoinRepositoryProvider
    extends $NotifierProvider<BinanceCoinRepository, ICoinRepository> {
  const BinanceCoinRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceCoinRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceCoinRepositoryHash();

  @$internal
  @override
  BinanceCoinRepository create() => BinanceCoinRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICoinRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICoinRepository>(value),
    );
  }
}

String _$binanceCoinRepositoryHash() =>
    r'df2a9e6efe9591eec4be9fbc72fcbec4ae0446e0';

abstract class _$BinanceCoinRepository extends $Notifier<ICoinRepository> {
  ICoinRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ICoinRepository, ICoinRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ICoinRepository, ICoinRepository>,
              ICoinRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

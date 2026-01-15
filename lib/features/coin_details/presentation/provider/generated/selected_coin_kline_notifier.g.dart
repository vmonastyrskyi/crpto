// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../selected_coin_kline_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCoinKlineNotifier)
const selectedCoinKlineProvider = SelectedCoinKlineNotifierProvider._();

final class SelectedCoinKlineNotifierProvider
    extends $NotifierProvider<SelectedCoinKlineNotifier, CoinKline?> {
  const SelectedCoinKlineNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCoinKlineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCoinKlineNotifierHash();

  @$internal
  @override
  SelectedCoinKlineNotifier create() => SelectedCoinKlineNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoinKline? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoinKline?>(value),
    );
  }
}

String _$selectedCoinKlineNotifierHash() =>
    r'84a373994c32557e3c4bde020669b7fd0e4f2fb6';

abstract class _$SelectedCoinKlineNotifier extends $Notifier<CoinKline?> {
  CoinKline? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CoinKline?, CoinKline?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CoinKline?, CoinKline?>,
              CoinKline?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

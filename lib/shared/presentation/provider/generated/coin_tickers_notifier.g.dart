// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_tickers_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CoinTickersNotifier)
const coinTickersProvider = CoinTickersNotifierProvider._();

final class CoinTickersNotifierProvider
    extends
        $AsyncNotifierProvider<CoinTickersNotifier, Map<String, CoinTicker>> {
  const CoinTickersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coinTickersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coinTickersNotifierHash();

  @$internal
  @override
  CoinTickersNotifier create() => CoinTickersNotifier();
}

String _$coinTickersNotifierHash() =>
    r'a637a9e8f41a521e289e36b0400ee07e52c1ce65';

abstract class _$CoinTickersNotifier
    extends $AsyncNotifier<Map<String, CoinTicker>> {
  FutureOr<Map<String, CoinTicker>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, CoinTicker>>,
              Map<String, CoinTicker>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, CoinTicker>>,
                Map<String, CoinTicker>
              >,
              AsyncValue<Map<String, CoinTicker>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

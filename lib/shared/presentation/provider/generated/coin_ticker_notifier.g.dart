// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_ticker_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CoinTickerNotifier)
const coinTickerProvider = CoinTickerNotifierFamily._();

final class CoinTickerNotifierProvider
    extends $NotifierProvider<CoinTickerNotifier, CoinTicker?> {
  const CoinTickerNotifierProvider._({
    required CoinTickerNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'coinTickerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coinTickerNotifierHash();

  @override
  String toString() {
    return r'coinTickerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CoinTickerNotifier create() => CoinTickerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoinTicker? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoinTicker?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CoinTickerNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coinTickerNotifierHash() =>
    r'41b72920b2c1fb24027b352743d7af76cebcbae3';

final class CoinTickerNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CoinTickerNotifier,
          CoinTicker?,
          CoinTicker?,
          CoinTicker?,
          String
        > {
  const CoinTickerNotifierFamily._()
    : super(
        retry: null,
        name: r'coinTickerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoinTickerNotifierProvider call(String symbol) =>
      CoinTickerNotifierProvider._(argument: symbol, from: this);

  @override
  String toString() => r'coinTickerProvider';
}

abstract class _$CoinTickerNotifier extends $Notifier<CoinTicker?> {
  late final _$args = ref.$arg as String;
  String get symbol => _$args;

  CoinTicker? build(String symbol);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<CoinTicker?, CoinTicker?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CoinTicker?, CoinTicker?>,
              CoinTicker?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

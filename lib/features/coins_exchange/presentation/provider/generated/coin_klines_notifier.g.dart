// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_klines_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CoinKlinesNotifier)
const coinKlinesProvider = CoinKlinesNotifierFamily._();

final class CoinKlinesNotifierProvider
    extends $AsyncNotifierProvider<CoinKlinesNotifier, List<CoinKline>> {
  const CoinKlinesNotifierProvider._({
    required CoinKlinesNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'coinKlinesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coinKlinesNotifierHash();

  @override
  String toString() {
    return r'coinKlinesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CoinKlinesNotifier create() => CoinKlinesNotifier();

  @override
  bool operator ==(Object other) {
    return other is CoinKlinesNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coinKlinesNotifierHash() =>
    r'f202acc9e2372c81e674e02a0e706bdc2c9fd253';

final class CoinKlinesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CoinKlinesNotifier,
          AsyncValue<List<CoinKline>>,
          List<CoinKline>,
          FutureOr<List<CoinKline>>,
          String
        > {
  const CoinKlinesNotifierFamily._()
    : super(
        retry: null,
        name: r'coinKlinesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoinKlinesNotifierProvider call(String symbol) =>
      CoinKlinesNotifierProvider._(argument: symbol, from: this);

  @override
  String toString() => r'coinKlinesProvider';
}

abstract class _$CoinKlinesNotifier extends $AsyncNotifier<List<CoinKline>> {
  late final _$args = ref.$arg as String;
  String get symbol => _$args;

  FutureOr<List<CoinKline>> build(String symbol);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<CoinKline>>, List<CoinKline>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CoinKline>>, List<CoinKline>>,
              AsyncValue<List<CoinKline>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

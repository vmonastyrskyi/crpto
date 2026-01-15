// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recent_trade_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentTradeNotifier)
const recentTradeProvider = RecentTradeNotifierFamily._();

final class RecentTradeNotifierProvider
    extends $NotifierProvider<RecentTradeNotifier, RecentTrade?> {
  const RecentTradeNotifierProvider._({
    required RecentTradeNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recentTradeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recentTradeNotifierHash();

  @override
  String toString() {
    return r'recentTradeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecentTradeNotifier create() => RecentTradeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecentTrade? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecentTrade?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecentTradeNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recentTradeNotifierHash() =>
    r'51b9adcf6ebd5e533597cadce1a2ad121a9764ef';

final class RecentTradeNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RecentTradeNotifier,
          RecentTrade?,
          RecentTrade?,
          RecentTrade?,
          String
        > {
  const RecentTradeNotifierFamily._()
    : super(
        retry: null,
        name: r'recentTradeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecentTradeNotifierProvider call(String symbol) =>
      RecentTradeNotifierProvider._(argument: symbol, from: this);

  @override
  String toString() => r'recentTradeProvider';
}

abstract class _$RecentTradeNotifier extends $Notifier<RecentTrade?> {
  late final _$args = ref.$arg as String;
  String get symbol => _$args;

  RecentTrade? build(String symbol);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<RecentTrade?, RecentTrade?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecentTrade?, RecentTrade?>,
              RecentTrade?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

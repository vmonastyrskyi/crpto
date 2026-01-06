// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recent_trades_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentTradesNotifier)
const recentTradesProvider = RecentTradesNotifierProvider._();

final class RecentTradesNotifierProvider
    extends
        $AsyncNotifierProvider<RecentTradesNotifier, Map<String, RecentTrade>> {
  const RecentTradesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentTradesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentTradesNotifierHash();

  @$internal
  @override
  RecentTradesNotifier create() => RecentTradesNotifier();
}

String _$recentTradesNotifierHash() =>
    r'ae6a20cedb2fe54317bd18796d566c69213a3195';

abstract class _$RecentTradesNotifier
    extends $AsyncNotifier<Map<String, RecentTrade>> {
  FutureOr<Map<String, RecentTrade>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, RecentTrade>>,
              Map<String, RecentTrade>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, RecentTrade>>,
                Map<String, RecentTrade>
              >,
              AsyncValue<Map<String, RecentTrade>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

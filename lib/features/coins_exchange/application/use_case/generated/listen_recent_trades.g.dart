// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listen_recent_trades.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListenRecentTradesUseCase)
const listenRecentTradesUseCaseProvider = ListenRecentTradesUseCaseProvider._();

final class ListenRecentTradesUseCaseProvider
    extends
        $NotifierProvider<
          ListenRecentTradesUseCase,
          Raw<Future<ListenRecentTradesUseCase>>
        > {
  const ListenRecentTradesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listenRecentTradesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listenRecentTradesUseCaseHash();

  @$internal
  @override
  ListenRecentTradesUseCase create() => ListenRecentTradesUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<ListenRecentTradesUseCase>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<Future<ListenRecentTradesUseCase>>>(value),
    );
  }
}

String _$listenRecentTradesUseCaseHash() =>
    r'a6cfda18adf91753c72d041859fa008b73c4e52a';

abstract class _$ListenRecentTradesUseCase
    extends $Notifier<Raw<Future<ListenRecentTradesUseCase>>> {
  Raw<Future<ListenRecentTradesUseCase>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<ListenRecentTradesUseCase>>,
              Raw<Future<ListenRecentTradesUseCase>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<ListenRecentTradesUseCase>>,
                Raw<Future<ListenRecentTradesUseCase>>
              >,
              Raw<Future<ListenRecentTradesUseCase>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

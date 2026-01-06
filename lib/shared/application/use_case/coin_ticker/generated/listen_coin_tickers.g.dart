// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listen_coin_tickers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListenCoinTickersUseCase)
const listenCoinTickersUseCaseProvider = ListenCoinTickersUseCaseProvider._();

final class ListenCoinTickersUseCaseProvider
    extends
        $NotifierProvider<
          ListenCoinTickersUseCase,
          Raw<Future<ListenCoinTickersUseCase>>
        > {
  const ListenCoinTickersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listenCoinTickersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listenCoinTickersUseCaseHash();

  @$internal
  @override
  ListenCoinTickersUseCase create() => ListenCoinTickersUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<ListenCoinTickersUseCase>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<Future<ListenCoinTickersUseCase>>>(value),
    );
  }
}

String _$listenCoinTickersUseCaseHash() =>
    r'0346f70a60cb5636df7ae88fe305457473eedcf3';

abstract class _$ListenCoinTickersUseCase
    extends $Notifier<Raw<Future<ListenCoinTickersUseCase>>> {
  Raw<Future<ListenCoinTickersUseCase>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<ListenCoinTickersUseCase>>,
              Raw<Future<ListenCoinTickersUseCase>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<ListenCoinTickersUseCase>>,
                Raw<Future<ListenCoinTickersUseCase>>
              >,
              Raw<Future<ListenCoinTickersUseCase>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

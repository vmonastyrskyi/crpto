// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../trade_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TradeRepository)
const tradeRepositoryProvider = TradeRepositoryProvider._();

final class TradeRepositoryProvider
    extends $NotifierProvider<TradeRepository, Raw<Future<ITradeRepository>>> {
  const TradeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tradeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tradeRepositoryHash();

  @$internal
  @override
  TradeRepository create() => TradeRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<ITradeRepository>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<ITradeRepository>>>(
        value,
      ),
    );
  }
}

String _$tradeRepositoryHash() => r'caff9a7ed92f98a16c4a148211b8b748201ab7da';

abstract class _$TradeRepository
    extends $Notifier<Raw<Future<ITradeRepository>>> {
  Raw<Future<ITradeRepository>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<ITradeRepository>>,
              Raw<Future<ITradeRepository>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<ITradeRepository>>,
                Raw<Future<ITradeRepository>>
              >,
              Raw<Future<ITradeRepository>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../ticker_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TickerRepository)
const tickerRepositoryProvider = TickerRepositoryProvider._();

final class TickerRepositoryProvider
    extends
        $NotifierProvider<TickerRepository, Raw<Future<ITickerRepository>>> {
  const TickerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tickerRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tickerRepositoryHash();

  @$internal
  @override
  TickerRepository create() => TickerRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<ITickerRepository>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<ITickerRepository>>>(
        value,
      ),
    );
  }
}

String _$tickerRepositoryHash() => r'2ddb603b536c9d32586c86fa0c4e5f76fb2d9d34';

abstract class _$TickerRepository
    extends $Notifier<Raw<Future<ITickerRepository>>> {
  Raw<Future<ITickerRepository>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<ITickerRepository>>,
              Raw<Future<ITickerRepository>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<ITickerRepository>>,
                Raw<Future<ITickerRepository>>
              >,
              Raw<Future<ITickerRepository>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

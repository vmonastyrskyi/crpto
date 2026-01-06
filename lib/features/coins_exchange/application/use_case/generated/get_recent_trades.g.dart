// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_recent_trades.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetRecentTradesUseCase)
const getRecentTradesUseCaseProvider = GetRecentTradesUseCaseProvider._();

final class GetRecentTradesUseCaseProvider
    extends
        $NotifierProvider<
          GetRecentTradesUseCase,
          Raw<Future<GetRecentTradesUseCase>>
        > {
  const GetRecentTradesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getRecentTradesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getRecentTradesUseCaseHash();

  @$internal
  @override
  GetRecentTradesUseCase create() => GetRecentTradesUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<GetRecentTradesUseCase>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<GetRecentTradesUseCase>>>(
        value,
      ),
    );
  }
}

String _$getRecentTradesUseCaseHash() =>
    r'2102d06083e7b123aa62a8c2272b5ee47d95ef6e';

abstract class _$GetRecentTradesUseCase
    extends $Notifier<Raw<Future<GetRecentTradesUseCase>>> {
  Raw<Future<GetRecentTradesUseCase>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<GetRecentTradesUseCase>>,
              Raw<Future<GetRecentTradesUseCase>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<GetRecentTradesUseCase>>,
                Raw<Future<GetRecentTradesUseCase>>
              >,
              Raw<Future<GetRecentTradesUseCase>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

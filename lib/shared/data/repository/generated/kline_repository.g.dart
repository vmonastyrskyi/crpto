// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../kline_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KlineRepository)
const klineRepositoryProvider = KlineRepositoryProvider._();

final class KlineRepositoryProvider
    extends $NotifierProvider<KlineRepository, IKlineRepository> {
  const KlineRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'klineRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$klineRepositoryHash();

  @$internal
  @override
  KlineRepository create() => KlineRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IKlineRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IKlineRepository>(value),
    );
  }
}

String _$klineRepositoryHash() => r'942f709a5f1a4f8625895a98730cdd6ee6f8d8b7';

abstract class _$KlineRepository extends $Notifier<IKlineRepository> {
  IKlineRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<IKlineRepository, IKlineRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IKlineRepository, IKlineRepository>,
              IKlineRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

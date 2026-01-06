// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_coin_klines.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetCoinKlinesUseCase)
const getCoinKlinesUseCaseProvider = GetCoinKlinesUseCaseProvider._();

final class GetCoinKlinesUseCaseProvider
    extends $NotifierProvider<GetCoinKlinesUseCase, GetCoinKlinesUseCase> {
  const GetCoinKlinesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCoinKlinesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCoinKlinesUseCaseHash();

  @$internal
  @override
  GetCoinKlinesUseCase create() => GetCoinKlinesUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCoinKlinesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCoinKlinesUseCase>(value),
    );
  }
}

String _$getCoinKlinesUseCaseHash() =>
    r'968f079e158027439ffacdfbfb2c98ab0ac3b1e8';

abstract class _$GetCoinKlinesUseCase extends $Notifier<GetCoinKlinesUseCase> {
  GetCoinKlinesUseCase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetCoinKlinesUseCase, GetCoinKlinesUseCase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetCoinKlinesUseCase, GetCoinKlinesUseCase>,
              GetCoinKlinesUseCase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

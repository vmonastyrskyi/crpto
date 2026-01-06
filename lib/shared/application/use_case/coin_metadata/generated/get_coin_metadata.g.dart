// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_coin_metadata.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetCoinMetadataUseCase)
const getCoinMetadataUseCaseProvider = GetCoinMetadataUseCaseProvider._();

final class GetCoinMetadataUseCaseProvider
    extends $NotifierProvider<GetCoinMetadataUseCase, GetCoinMetadataUseCase> {
  const GetCoinMetadataUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCoinMetadataUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCoinMetadataUseCaseHash();

  @$internal
  @override
  GetCoinMetadataUseCase create() => GetCoinMetadataUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCoinMetadataUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCoinMetadataUseCase>(value),
    );
  }
}

String _$getCoinMetadataUseCaseHash() =>
    r'89379a181a90516379a775322c501c460cb718d7';

abstract class _$GetCoinMetadataUseCase
    extends $Notifier<GetCoinMetadataUseCase> {
  GetCoinMetadataUseCase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<GetCoinMetadataUseCase, GetCoinMetadataUseCase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetCoinMetadataUseCase, GetCoinMetadataUseCase>,
              GetCoinMetadataUseCase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

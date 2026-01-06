// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_selected_coins.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetSelectedCoinsUseCase)
const getSelectedCoinsUseCaseProvider = GetSelectedCoinsUseCaseProvider._();

final class GetSelectedCoinsUseCaseProvider
    extends
        $NotifierProvider<GetSelectedCoinsUseCase, GetSelectedCoinsUseCase> {
  const GetSelectedCoinsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSelectedCoinsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSelectedCoinsUseCaseHash();

  @$internal
  @override
  GetSelectedCoinsUseCase create() => GetSelectedCoinsUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSelectedCoinsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSelectedCoinsUseCase>(value),
    );
  }
}

String _$getSelectedCoinsUseCaseHash() =>
    r'5de9d62f9e5b7d7fcd2e40a2ee2f171775327706';

abstract class _$GetSelectedCoinsUseCase
    extends $Notifier<GetSelectedCoinsUseCase> {
  GetSelectedCoinsUseCase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<GetSelectedCoinsUseCase, GetSelectedCoinsUseCase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetSelectedCoinsUseCase, GetSelectedCoinsUseCase>,
              GetSelectedCoinsUseCase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

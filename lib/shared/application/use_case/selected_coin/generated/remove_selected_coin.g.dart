// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../remove_selected_coin.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoveSelectedCoinUseCase)
const removeSelectedCoinUseCaseProvider = RemoveSelectedCoinUseCaseProvider._();

final class RemoveSelectedCoinUseCaseProvider
    extends
        $NotifierProvider<
          RemoveSelectedCoinUseCase,
          RemoveSelectedCoinUseCase
        > {
  const RemoveSelectedCoinUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'removeSelectedCoinUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$removeSelectedCoinUseCaseHash();

  @$internal
  @override
  RemoveSelectedCoinUseCase create() => RemoveSelectedCoinUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoveSelectedCoinUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoveSelectedCoinUseCase>(value),
    );
  }
}

String _$removeSelectedCoinUseCaseHash() =>
    r'c33146bae65c270c2116576d002fbc9b33c96113';

abstract class _$RemoveSelectedCoinUseCase
    extends $Notifier<RemoveSelectedCoinUseCase> {
  RemoveSelectedCoinUseCase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<RemoveSelectedCoinUseCase, RemoveSelectedCoinUseCase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RemoveSelectedCoinUseCase, RemoveSelectedCoinUseCase>,
              RemoveSelectedCoinUseCase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

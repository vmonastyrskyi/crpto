// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../add_selected_coin.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddSelectedCoinUseCase)
const addSelectedCoinUseCaseProvider = AddSelectedCoinUseCaseProvider._();

final class AddSelectedCoinUseCaseProvider
    extends $NotifierProvider<AddSelectedCoinUseCase, AddSelectedCoinUseCase> {
  const AddSelectedCoinUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addSelectedCoinUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addSelectedCoinUseCaseHash();

  @$internal
  @override
  AddSelectedCoinUseCase create() => AddSelectedCoinUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddSelectedCoinUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddSelectedCoinUseCase>(value),
    );
  }
}

String _$addSelectedCoinUseCaseHash() =>
    r'910752a6771a9d2e4cb0bd8034ea96ccf53f53af';

abstract class _$AddSelectedCoinUseCase
    extends $Notifier<AddSelectedCoinUseCase> {
  AddSelectedCoinUseCase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AddSelectedCoinUseCase, AddSelectedCoinUseCase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddSelectedCoinUseCase, AddSelectedCoinUseCase>,
              AddSelectedCoinUseCase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

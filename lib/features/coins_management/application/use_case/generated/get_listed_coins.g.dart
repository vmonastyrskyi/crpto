// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_listed_coins.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetListedCoinsUseCase)
const getListedCoinsUseCaseProvider = GetListedCoinsUseCaseProvider._();

final class GetListedCoinsUseCaseProvider
    extends $NotifierProvider<GetListedCoinsUseCase, GetListedCoinsUseCase> {
  const GetListedCoinsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getListedCoinsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getListedCoinsUseCaseHash();

  @$internal
  @override
  GetListedCoinsUseCase create() => GetListedCoinsUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetListedCoinsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetListedCoinsUseCase>(value),
    );
  }
}

String _$getListedCoinsUseCaseHash() =>
    r'8015631fc7edca00d02b4bc4a5de4cf98ad900fc';

abstract class _$GetListedCoinsUseCase
    extends $Notifier<GetListedCoinsUseCase> {
  GetListedCoinsUseCase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetListedCoinsUseCase, GetListedCoinsUseCase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetListedCoinsUseCase, GetListedCoinsUseCase>,
              GetListedCoinsUseCase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

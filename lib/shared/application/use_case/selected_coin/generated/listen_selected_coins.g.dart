// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listen_selected_coins.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListenSelectedCoinsUseCase)
const listenSelectedCoinsUseCaseProvider =
    ListenSelectedCoinsUseCaseProvider._();

final class ListenSelectedCoinsUseCaseProvider
    extends
        $NotifierProvider<
          ListenSelectedCoinsUseCase,
          ListenSelectedCoinsUseCase
        > {
  const ListenSelectedCoinsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listenSelectedCoinsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listenSelectedCoinsUseCaseHash();

  @$internal
  @override
  ListenSelectedCoinsUseCase create() => ListenSelectedCoinsUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListenSelectedCoinsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListenSelectedCoinsUseCase>(value),
    );
  }
}

String _$listenSelectedCoinsUseCaseHash() =>
    r'851ec903163938a9a2afa93178f7b62b3d19fd21';

abstract class _$ListenSelectedCoinsUseCase
    extends $Notifier<ListenSelectedCoinsUseCase> {
  ListenSelectedCoinsUseCase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<ListenSelectedCoinsUseCase, ListenSelectedCoinsUseCase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ListenSelectedCoinsUseCase,
                ListenSelectedCoinsUseCase
              >,
              ListenSelectedCoinsUseCase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

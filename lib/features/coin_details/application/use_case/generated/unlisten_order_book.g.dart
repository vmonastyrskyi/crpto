// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../unlisten_order_book.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnlistenOrderBookUseCase)
const unlistenOrderBookUseCaseProvider = UnlistenOrderBookUseCaseProvider._();

final class UnlistenOrderBookUseCaseProvider
    extends
        $NotifierProvider<
          UnlistenOrderBookUseCase,
          Raw<Future<UnlistenOrderBookUseCase>>
        > {
  const UnlistenOrderBookUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unlistenOrderBookUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unlistenOrderBookUseCaseHash();

  @$internal
  @override
  UnlistenOrderBookUseCase create() => UnlistenOrderBookUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<UnlistenOrderBookUseCase>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<Future<UnlistenOrderBookUseCase>>>(value),
    );
  }
}

String _$unlistenOrderBookUseCaseHash() =>
    r'f6c17dd6d0fdc7509fc3a053dfa3ec47313ad349';

abstract class _$UnlistenOrderBookUseCase
    extends $Notifier<Raw<Future<UnlistenOrderBookUseCase>>> {
  Raw<Future<UnlistenOrderBookUseCase>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<UnlistenOrderBookUseCase>>,
              Raw<Future<UnlistenOrderBookUseCase>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<UnlistenOrderBookUseCase>>,
                Raw<Future<UnlistenOrderBookUseCase>>
              >,
              Raw<Future<UnlistenOrderBookUseCase>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

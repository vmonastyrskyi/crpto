// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listen_order_book.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListenOrderBookUseCase)
const listenOrderBookUseCaseProvider = ListenOrderBookUseCaseProvider._();

final class ListenOrderBookUseCaseProvider
    extends
        $NotifierProvider<
          ListenOrderBookUseCase,
          Raw<Future<ListenOrderBookUseCase>>
        > {
  const ListenOrderBookUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listenOrderBookUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listenOrderBookUseCaseHash();

  @$internal
  @override
  ListenOrderBookUseCase create() => ListenOrderBookUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<ListenOrderBookUseCase>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<ListenOrderBookUseCase>>>(
        value,
      ),
    );
  }
}

String _$listenOrderBookUseCaseHash() =>
    r'90e182c9495e324ecc6014a62380e88f49ebabab';

abstract class _$ListenOrderBookUseCase
    extends $Notifier<Raw<Future<ListenOrderBookUseCase>>> {
  Raw<Future<ListenOrderBookUseCase>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<ListenOrderBookUseCase>>,
              Raw<Future<ListenOrderBookUseCase>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<ListenOrderBookUseCase>>,
                Raw<Future<ListenOrderBookUseCase>>
              >,
              Raw<Future<ListenOrderBookUseCase>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

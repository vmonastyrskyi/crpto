// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_order_book.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetOrderBookUseCase)
const getOrderBookUseCaseProvider = GetOrderBookUseCaseProvider._();

final class GetOrderBookUseCaseProvider
    extends
        $NotifierProvider<
          GetOrderBookUseCase,
          Raw<Future<GetOrderBookUseCase>>
        > {
  const GetOrderBookUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getOrderBookUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getOrderBookUseCaseHash();

  @$internal
  @override
  GetOrderBookUseCase create() => GetOrderBookUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<GetOrderBookUseCase>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<GetOrderBookUseCase>>>(
        value,
      ),
    );
  }
}

String _$getOrderBookUseCaseHash() =>
    r'6d5d700cd69737324e37d563b21e4d96793b1a9d';

abstract class _$GetOrderBookUseCase
    extends $Notifier<Raw<Future<GetOrderBookUseCase>>> {
  Raw<Future<GetOrderBookUseCase>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<GetOrderBookUseCase>>,
              Raw<Future<GetOrderBookUseCase>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<GetOrderBookUseCase>>,
                Raw<Future<GetOrderBookUseCase>>
              >,
              Raw<Future<GetOrderBookUseCase>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

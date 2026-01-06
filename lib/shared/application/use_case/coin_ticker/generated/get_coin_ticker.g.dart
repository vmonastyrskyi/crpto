// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_coin_ticker.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetCoinTickerUseCase)
const getCoinTickerUseCaseProvider = GetCoinTickerUseCaseProvider._();

final class GetCoinTickerUseCaseProvider
    extends
        $NotifierProvider<
          GetCoinTickerUseCase,
          Raw<Future<GetCoinTickerUseCase>>
        > {
  const GetCoinTickerUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCoinTickerUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCoinTickerUseCaseHash();

  @$internal
  @override
  GetCoinTickerUseCase create() => GetCoinTickerUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<GetCoinTickerUseCase>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<GetCoinTickerUseCase>>>(
        value,
      ),
    );
  }
}

String _$getCoinTickerUseCaseHash() =>
    r'59572d0162f9d050e0c65173b181e2347a2fe610';

abstract class _$GetCoinTickerUseCase
    extends $Notifier<Raw<Future<GetCoinTickerUseCase>>> {
  Raw<Future<GetCoinTickerUseCase>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<GetCoinTickerUseCase>>,
              Raw<Future<GetCoinTickerUseCase>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<GetCoinTickerUseCase>>,
                Raw<Future<GetCoinTickerUseCase>>
              >,
              Raw<Future<GetCoinTickerUseCase>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

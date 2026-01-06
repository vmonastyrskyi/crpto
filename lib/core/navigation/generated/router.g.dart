// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppRouter)
const appRouterProvider = AppRouterProvider._();

final class AppRouterProvider extends $NotifierProvider<AppRouter, GoRouter> {
  const AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  AppRouter create() => AppRouter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'92d9fb8e146f671851f076a173f5f3b0dee01f6d';

abstract class _$AppRouter extends $Notifier<GoRouter> {
  GoRouter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GoRouter, GoRouter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GoRouter, GoRouter>,
              GoRouter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

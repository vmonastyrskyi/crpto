// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dio_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioClient)
const dioClientProvider = DioClientFamily._();

final class DioClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioClientProvider._({
    required DioClientFamily super.from,
    required ({List<Interceptor>? interceptors, String? baseUrl})
    super.argument,
  }) : super(
         retry: null,
         name: r'dioClientProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dioClientHash();

  @override
  String toString() {
    return r'dioClientProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    final argument =
        this.argument as ({List<Interceptor>? interceptors, String? baseUrl});
    return dioClient(
      ref,
      interceptors: argument.interceptors,
      baseUrl: argument.baseUrl,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DioClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dioClientHash() => r'ca36076e5b2c83b4f4ac8e1e6bb5c7e5c023b25c';

final class DioClientFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Dio,
          ({List<Interceptor>? interceptors, String? baseUrl})
        > {
  const DioClientFamily._()
    : super(
        retry: null,
        name: r'dioClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DioClientProvider call({List<Interceptor>? interceptors, String? baseUrl}) =>
      DioClientProvider._(
        argument: (interceptors: interceptors, baseUrl: baseUrl),
        from: this,
      );

  @override
  String toString() => r'dioClientProvider';
}

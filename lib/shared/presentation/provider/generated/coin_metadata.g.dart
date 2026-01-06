// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_metadata.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coinMetadata)
const coinMetadataProvider = CoinMetadataFamily._();

final class CoinMetadataProvider
    extends $FunctionalProvider<CoinMetadata, CoinMetadata, CoinMetadata>
    with $Provider<CoinMetadata> {
  const CoinMetadataProvider._({
    required CoinMetadataFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'coinMetadataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coinMetadataHash();

  @override
  String toString() {
    return r'coinMetadataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<CoinMetadata> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoinMetadata create(Ref ref) {
    final argument = this.argument as String;
    return coinMetadata(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoinMetadata value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoinMetadata>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CoinMetadataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coinMetadataHash() => r'dbb7c6f4005930aa24a35126384cf4f6e0b19945';

final class CoinMetadataFamily extends $Family
    with $FunctionalFamilyOverride<CoinMetadata, String> {
  const CoinMetadataFamily._()
    : super(
        retry: null,
        name: r'coinMetadataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoinMetadataProvider call(String symbol) =>
      CoinMetadataProvider._(argument: symbol, from: this);

  @override
  String toString() => r'coinMetadataProvider';
}

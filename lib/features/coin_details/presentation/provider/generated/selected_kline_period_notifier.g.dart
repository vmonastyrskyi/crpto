// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../selected_kline_period_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedKlinePeriodNotifier)
const selectedKlinePeriodProvider = SelectedKlinePeriodNotifierProvider._();

final class SelectedKlinePeriodNotifierProvider
    extends $NotifierProvider<SelectedKlinePeriodNotifier, KlinePeriod> {
  const SelectedKlinePeriodNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedKlinePeriodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedKlinePeriodNotifierHash();

  @$internal
  @override
  SelectedKlinePeriodNotifier create() => SelectedKlinePeriodNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KlinePeriod value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KlinePeriod>(value),
    );
  }
}

String _$selectedKlinePeriodNotifierHash() =>
    r'a19562666a857c5cff0c3774e4430507290ab517';

abstract class _$SelectedKlinePeriodNotifier extends $Notifier<KlinePeriod> {
  KlinePeriod build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<KlinePeriod, KlinePeriod>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<KlinePeriod, KlinePeriod>,
              KlinePeriod,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

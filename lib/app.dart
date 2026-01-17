import 'package:crpto/features/coins_management/presentation/view_model/listed_coins_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/router.dart';
import 'core/utils/theme/themes.dart';

class CrptoApp extends ConsumerWidget {
  const CrptoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return _EagerInitialization(
      child: MaterialApp.router(
        routerConfig: appRouter,
        scrollBehavior: _MobileScrollBehavior().copyWith(scrollbars: false),
        theme: darkTheme,
      ),
    );
  }
}

class _EagerInitialization extends ConsumerStatefulWidget {
  const _EagerInitialization({required this.child});

  final Widget child;

  @override
  ConsumerState<_EagerInitialization> createState() =>
      _EagerInitializationState();
}

class _EagerInitializationState extends ConsumerState<_EagerInitialization> {
  @override
  Widget build(BuildContext context) {
    ref.watch(listedCoinsViewModelProvider);

    return widget.child;
  }
}

class _MobileScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

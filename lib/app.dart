import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/router.dart';
import 'core/utils/app_colors.dart';
import 'flavors.dart';

ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  highlightColor: AppColors.splashColorDark,
  splashColor: AppColors.splashColorDark,
  dividerTheme: const DividerThemeData(color: Colors.transparent),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
      value: (_) => const FadeForwardsPageTransitionsBuilder(),
      TargetPlatform.values,
    ),
  ),
);

class CrptoApp extends ConsumerWidget {
  const CrptoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return _EagerInitialization(
      child: MaterialApp.router(
        routerConfig: appRouter,
        builder: (_, child) =>
            _buildFlavorBanner(show: kDebugMode, child: child),
        theme: darkTheme,
      ),
    );
  }

  Widget _buildFlavorBanner({bool show = true, Widget? child}) {
    return show
        ? Banner(
            message: F.name.toUpperCase(),
            location: BannerLocation.topStart,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 11.0,
              height: 1.0,
            ),
            color: Colors.green,
            child: child,
          )
        : child ?? const SizedBox.shrink();
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
    // ref.watch(listedCoinsViewModelProvider);

    return widget.child;
  }
}

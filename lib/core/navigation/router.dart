import 'package:crpto/features/market/presentation/ui/market_screen.dart';
import 'package:crpto/features/market_coins/presentation/ui/market_coins_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
class AppRouter extends _$AppRouter {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'market',
          builder: (_, __) => const MarketScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'coins',
              name: 'coins',
              builder: (_, __) => const MarketCoinsScreen(),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/features/coin_details/presentation/ui/coin_details_screen.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/coins_exchange_screen.dart';
import 'package:crpto/features/coins_management/presentation/ui/coins_management_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/router.g.dart';

@riverpod
class AppRouter extends _$AppRouter {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: RouteNames.coinsExchange,
          builder: (_, _) => const CoinsExchangeScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'coins-management',
              name: RouteNames.coinsManagement,
              builder: (_, _) => const CoinsManagementScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/coin-details/:symbol',
          name: RouteNames.coinDetails,
          builder: (_, state) {
            final symbol = state.pathParameters['symbol'] ?? '#';

            return CoinDetailsScreen(symbol: symbol);
          },
        ),
      ],
    );
  }
}

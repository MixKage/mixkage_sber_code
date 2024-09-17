import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mixkage_sber_code/common/screens/error_screen.dart';
import 'package:mixkage_sber_code/feature/home_screen/screens/home_screen.dart';
import 'package:mixkage_sber_code/feature/settings_screen/screens/settings_screen.dart';
import 'package:mixkage_sber_code/routes/routes.dart';

/// Настроенный роутер для всего приложения
abstract class AppRouter {
  const AppRouter();

  /// Экземпляр настроенного роутера
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    // TODO: RETURN IT
    // initialLocation: '/',
    initialLocation: Routes.home.toPath,
    routes: [
      GoRoute(
        path: '/',
        redirect: (final context, final state) => Routes.home.toPath,
      ),
      GoRoute(
        path: Routes.home.toPath,
        name: Routes.home.toName,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.settings.toPath,
        name: Routes.settings.toName,
        builder: (context, state) {
          return const SettingsScreen();
        },
      ),

      // StatefulShellRoute.indexedStack(
      //   builder: (final context, final state, final navigationShell) =>
      //       CharactersNavigationShell(navigationShell: navigationShell),
      //   branches: <StatefulShellBranch>[
      //     StatefulShellBranch(
      //       routes: <GoRoute>[
      //         GoRoute(
      //           path: Routes.charactersExample.toPath,
      //           builder: (final context, final state) =>
      //               const CharactersScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: <GoRoute>[
      //         GoRoute(
      //           path: Routes.favouriteCharactersExample.toPath,
      //           builder: (final context, final state) =>
      //               const FavouriteCharactersScreen(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    ],
    errorPageBuilder: (final context, final state) => const MaterialPage(
      child: ErrorScreen(),
    ),
  );
}

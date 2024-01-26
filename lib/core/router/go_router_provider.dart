import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres_in_api_example/core/providers/token_provider.dart';
import 'package:reqres_in_api_example/core/router/routes/auth.dart';
import 'package:reqres_in_api_example/tab_view.dart';

import 'navigator_observer.dart';
import 'routes/users.dart';
import 'routes/splash.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final usersNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Users');
    final tokenListener = ref.watch(tokenProvider);

    return GoRouter(
      initialLocation: '/',
      observers: [AppNavigatorObserver(ref: ref)],
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      refreshListenable: tokenListener,
      redirect: (context, state) {
        if (tokenListener.token == null) {
          return (state.matchedLocation == '/auth/register' ||
                  state.matchedLocation == '/')
              ? null
              : '/auth/login';
        } else {
          return null;
        }
      },
      routes: <RouteBase>[
        $splashRoute,
        $authRoute,
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state, navigationShell) {
            return TabBarView(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: usersNavigatorKey,
              observers: [AppNavigatorObserver(ref: ref)],
              routes: [$usersRoute],
            ),
          ],
        ),
      ],
    );
  },
);

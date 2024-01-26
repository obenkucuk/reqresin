import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reqres_in_api_example/features/splash/splash_view.dart';

part 'splash.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/',
  name: 'Splash',
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashView();
}

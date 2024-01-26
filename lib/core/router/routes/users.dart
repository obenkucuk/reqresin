import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:reqres_in_api_example/features/users/view/users_view.dart';

part 'users.g.dart';

@TypedGoRoute<UsersRoute>(
  path: '/users',
  name: 'Users',
  routes: <TypedGoRoute<GoRouteData>>[],
)
class UsersRoute extends GoRouteData {
  const UsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const UsersView();
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
final class TabBarView extends ConsumerWidget {
  const TabBarView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void onDestinationSelected(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: navigationShell,
    );
  }
}

import 'package:flutter/cupertino.dart';
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

enum Destinations {
  first,
  second;

  String get label {
    switch (this) {
      case Destinations.first:
        return 'First';
      case Destinations.second:
        return 'Second';
    }
  }

  Widget get icon {
    switch (this) {
      case Destinations.first:
        return Icon(Icons.home);
      case Destinations.second:
        return Icon(Icons.settings);
    }
  }
}

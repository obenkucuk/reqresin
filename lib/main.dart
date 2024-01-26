import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres_in_api_example/core/providers/token_provider.dart';
import 'package:reqres_in_api_example/core/router/go_router_provider.dart';
import 'package:reqres_in_api_example/core/theme/my_theme_data.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context,
        minTextAdapt: true, designSize: const Size(430, 932));

    ref.watch(tokenProvider.notifier).getToken();
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Reqres.in API Example',
      themeAnimationCurve: Curves.easeInOutCirc,
      themeMode: ThemeMode.dark,
      theme: const MyThemeData().light,
      darkTheme: const MyThemeData().dark,
    );
  }
}

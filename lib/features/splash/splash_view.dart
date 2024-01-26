// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres_in_api_example/components/gradient_background_widget.dart';
import 'package:reqres_in_api_example/core/providers/token_provider.dart';
import 'package:reqres_in_api_example/core/router/routes/auth.dart';
import 'package:reqres_in_api_example/core/router/routes/users.dart';

@immutable
final class SplashView extends ConsumerWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 1), () async {
      final token = ref.read(tokenProvider.notifier).token;

      if (token == null) {
        const LoginRoute().go(context);
      } else {
        const UsersRoute().go(context);
      }
    });

    return const Material(
      child: GradientBackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

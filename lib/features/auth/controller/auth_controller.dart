import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres_in_api_example/constants/storage_constants.dart';
import 'package:reqres_in_api_example/core/models/error_model.dart';
import 'package:reqres_in_api_example/core/providers/token_provider.dart';
import 'package:reqres_in_api_example/core/screen_state/screen_state.dart';
import 'package:reqres_in_api_example/features/auth/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends AutoDisposeNotifier<ScreenState> {
  @override
  ScreenState build() => InitialState();

  Future<void> login(
    GlobalKey<FormState> formKey, {
    required String email,
    required String password,
  }) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    state = LoadingState();

    try {
      final response = await const AuthService().login(email, password);

      if (response.token != null) {
        final tokenNotifier = ref.watch(tokenProvider.notifier);
        tokenNotifier.setToken(response.token!);
      }
    } on HttpException catch (e, s) {
      final json = jsonDecode(e.message);
      final error = ErrorModel.fromJson(json);

      state =
          ErrorState(message: error.error ?? 'Unknown Error', stackTrace: s);
    } catch (e, s) {
      state = ErrorState(message: 'Unknown Error', stackTrace: s);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeys.token.key);

    final tokenNotifier = ref.watch(tokenProvider.notifier);
    tokenNotifier.setToken(null);
  }
}

final authProvider = AutoDisposeNotifierProvider<AuthController, ScreenState>(
  () => AuthController(),
);

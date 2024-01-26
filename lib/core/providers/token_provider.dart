import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres_in_api_example/constants/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tokenProvider =
    ChangeNotifierProvider<TokenController>((ref) => TokenController());

class TokenController with ChangeNotifier {
  String? token;

  Future<void> setToken(String? t) async {
    if (t != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(StorageKeys.token.key, t);
    }

    token = t;
    notifyListeners();
  }

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString(StorageKeys.token.key);
    token = t;
  }
}

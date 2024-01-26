import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:reqres_in_api_example/constants/icons.dart';
import 'package:reqres_in_api_example/core/router/go_router_provider.dart';

void showToast({
  required String message,
  ToastType toastType = ToastType.error,
}) =>
    DelightToastBar(
      autoDismiss: true,
      snackbarDuration: const Duration(seconds: 3),
      builder: (context) => ToastCard(
        color: toastType.color,
        leading: toastType.icon.toWidget(color: Colors.white),
        title: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    ).show(rootNavigatorKey.currentContext!);

enum ToastType {
  error,
  success,
  info;

  Color get color {
    switch (this) {
      case error:
        return Colors.redAccent;
      case success:
        return Colors.green;
      case info:
        return Colors.amber;
    }
  }

  MyIcons get icon {
    switch (this) {
      case error:
        return MyIcons.times_hexagon;
      case success:
        return MyIcons.check_circle;
      case info:
        return MyIcons.exclamation;
    }
  }
}

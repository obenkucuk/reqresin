// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reqres_in_api_example/components/gradient_mask.dart';

enum MyIcons {
  angle_right,
  power,
  check_circle,
  exclamation,
  times_hexagon,
  eye,
  eye_off,
  user,
  user_add;

  String get path => 'assets/icons/$name.svg';

  Widget toWidget({
    double? size,
    Color? color,
    bool isColorful = false,
    VoidCallback? onPressed,
    bool hasGradientMask = false,
  }) {
    return SvgWidget(
      path: path,
      color: color,
      size: size,
      isColorful: isColorful,
      onPressed: onPressed,
      hasGradientMask: hasGradientMask,
    );
  }
}

@immutable
final class SvgWidget extends StatelessWidget {
  const SvgWidget({
    super.key,
    required this.path,
    this.color,
    this.size,
    this.isColorful = false,
    this.onPressed,
    required this.hasGradientMask,
  });

  final String path;
  final Color? color;
  final double? size;
  final bool isColorful;
  final VoidCallback? onPressed;
  final bool hasGradientMask;

  @override
  Widget build(BuildContext context) {
    final child = SizedBox.square(
      dimension: size?.r ?? 24.r,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: SvgPicture.asset(
          path,
          colorFilter: isColorful
              ? null
              : ColorFilter.mode(
                  color ?? Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
          height: size?.r ?? 24.r,
          width: size?.r ?? 24.r,
          semanticsLabel: path,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        ),
      ),
    );

    if (hasGradientMask) {
      return GradientMaskWidget(child: child);
    }
    return child;
  }
}

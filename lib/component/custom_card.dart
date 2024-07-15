import 'package:flutter/material.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.width,
    this.height,
    this.child,
    this.onTap,
    this.color,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 100.h,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}

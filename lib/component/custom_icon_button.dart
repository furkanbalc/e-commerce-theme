import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_svg_widget.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final String icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: () {},
      icon: CustomSvgWidget(
        width: iconSize ?? 24.adaptSize,
        height: iconSize ?? 24.adaptSize,
        fit: BoxFit.fill,
        color: iconColor,
        svg: icon,
      ),
    );
  }
}

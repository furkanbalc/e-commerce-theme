import 'package:flutter/material.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.decoration, this.txtAlign, this.height, this.maxLines, this.overflow,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDecoration? decoration;
  final TextAlign? txtAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: txtAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 24.fSize,
        fontFamily: fontFamily ?? 'Metropolis',
        fontWeight: fontWeight ?? FontWeight.w600,
        decoration: decoration,
        height: height,
        decorationColor: color ?? Colors.black,
        overflow: overflow ?? TextOverflow.visible,
      ),
    );
  }
}

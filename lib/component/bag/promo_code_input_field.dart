import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class PromoCodeInputField extends StatefulWidget {
  const PromoCodeInputField({
    super.key,
    this.readOnly,
    this.onPressed,
    this.enterCode,
    this.controller,
  });

  final bool? readOnly;
  final VoidCallback? onPressed;
  final VoidCallback? enterCode;
  final TextEditingController? controller;

  @override
  State<PromoCodeInputField> createState() => _PromoCodeInputFieldState();
}

class _PromoCodeInputFieldState extends State<PromoCodeInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.v,
      child: TextField(
        controller: widget.controller,
        onTap: widget.onPressed,
        readOnly: widget.readOnly ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter your promo code',
          hintStyle:  TextStyle(fontSize: 14.fSize, color: AppColors.greyColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          suffixIcon: InkWell(
            onTap: widget.enterCode,
            child: SvgPicture.asset('assets/svg/arrow-right-circular.svg'),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomSwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;

  const CustomSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      title: CustomText(text: title, fontSize: 14.fSize, fontWeight: FontWeight.w500),
      trailing: Transform.scale(
        scale: 1.2,
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.greenColor,
          activeTrackColor: Colors.green.withOpacity(.1),
          inactiveThumbColor: Colors.white,
          trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
          trackOutlineWidth: const MaterialStatePropertyAll(0),
          inactiveTrackColor: AppColors.greyColor.withOpacity(.1),
        ),
      ),
      onTap: () {
        onChanged(!value);
      },
    );
  }
}

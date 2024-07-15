import 'package:flutter/material.dart';
import 'package:my_theme/constants/color.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'shopping',
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

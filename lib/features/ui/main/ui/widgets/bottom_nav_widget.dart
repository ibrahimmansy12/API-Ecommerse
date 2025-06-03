// features/main/ui/widgets/bottom_nav_widget.dart

import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    this.onTap,
    this.icon,
  });
  final Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 2.h,
        width: 1.h,
        child: Icon(
          icon,
          color: MyColorsManager.white,
        ),
      ),
    );
  }
}

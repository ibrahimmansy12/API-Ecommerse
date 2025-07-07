// features/ui/profile/ui/widget/profile_app_bar.dart

import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
// ...existing code...
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColorsManager.scafouldrColor,
      elevation: 0,
      leading: Icon(
        Icons.qr_code_scanner_outlined,
        size: 18.sp,
        color: MyColorsManager.black,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Flag_of_Egypt.svg.png",
                  width: 6.w,
                  height: 2.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  width: 0.5.w,
                  height: 2.h,
                  color: MyColorsManager.grey,
                ),
                Text(
                  "Egy",
                  style: MyTextStyles.font18blackLight
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 18.sp),
                ),
                horezontalSpace(1),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Icon(Icons.settings_outlined),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

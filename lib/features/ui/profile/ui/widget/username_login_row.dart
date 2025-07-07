// features/ui/profile/ui/widget/username_login_row.dart
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:sizer/sizer.dart';

class UserNameLoginRow extends StatelessWidget {
  const UserNameLoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18.sp,
            backgroundColor: MyColorsManager.grey.withValues(alpha: 0.3),
            child: Icon(
              Icons.person,
              // size: 50,
              color: MyColorsManager.grey,
            ),
          ),
          horezontalSpace(2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username',
                style: MyTextStyles.font15BlackRegular,
              ),
              Text(
                'Hello, please login to your account',
                style: MyTextStyles.font15BlackRegular,
              ),
            ],
          ),
          // const SizedBox(height: 10),
          //  horezontalSpace(5),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.edit,
                size: 18.sp,
              ))
        ],
      ),
    );
  }
}
/**SizedBox(
            height: 3.6.h,
            width: 18.w,
            child: MyTextButton(
              backGroundColor: MyColorsManager.black,
              // buttonhight: 12.h,
              borderRadius: 2.h,
              buttonText: "login",
              // buttonwidth: 90.w,
              verticalPading: 0.2.h,
              textStyle: MyTextStyles.font15WhiteLight,
              onpressed: () {},
            ),
          ) */

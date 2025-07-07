// features/ui/profile/ui/widget/list_tile_widget.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// features/ui/profile/ui/widget/list_tile_widget.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.onTap,
    this.leadingIcon,
    this.title,
  });
  final void Function()? onTap;
  final IconData? leadingIcon;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon ?? Icons.person,
        color: MyColorsManager.lighterGrey,
      ),
      title: Text(
        title ?? 'Username',
        style: MyTextStyles.font15BlackRegular,
      ),
      // subtitle: const Text('Hello, please login to your account'),
      trailing: title != "Settings"
          ? Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15.sp,
            )
          : Image.asset(
              "assets/images/Flag_of_Egypt.svg.png",
              width: 5.w,
              height: 2.h,
            ),
      // contentPadding:
      //     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }
}
/**ElevatedButton(
        onPressed: () {
          // Handle login action
        },
        child: const Text('Login'),
      ), */

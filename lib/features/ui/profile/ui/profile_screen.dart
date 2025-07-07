// features/ui/profile/ui/profile_screen.dart
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/features/ui/profile/ui/widget/list_tile_widget.dart';
import 'package:apiecommerse/features/ui/profile/ui/widget/profile_app_bar.dart';
import 'package:apiecommerse/features/ui/profile/ui/widget/username_login_row.dart';
import 'package:community_material_icon/community_material_icon.dart'; // ...existing code...
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorsManager.scafouldrColor,
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserNameLoginRow(),
            horezontalSpace(2),
            Container(
              color: MyColorsManager.morelightGrey,
              child: Column(
                children: [
                  ListTileWidget(
                    onTap: () {
                      context.pushNamed(ERouts.loginScreen);
                    },
                    title: " My Orders",
                    leadingIcon: CommunityMaterialIcons.truck_fast_outline,
                  ),
                  ListTileWidget(
                    onTap: () {
                      context.pushNamed(ERouts.favoriteScreen);
                    },
                    title: "My Favorites",
                    leadingIcon: CommunityMaterialIcons.heart_outline,
                  ),
                  ListTileWidget(
                    onTap: () {
                      context.pushNamed(ERouts.cartscreen);
                    },
                    title: "Cart",
                    leadingIcon: CommunityMaterialIcons.shopping,
                  ),
                ],
              ),
            ),
            verticalSpace(1),
            Container(
              color: MyColorsManager.morelightGrey,
              child: Column(
                children: [
                  ListTileWidget(
                    onTap: () {},
                    title: "Coupons",
                    leadingIcon: CommunityMaterialIcons.tag_outline,
                  ),
                  ListTileWidget(
                    onTap: () {},
                    title: "My Store",
                    leadingIcon: CommunityMaterialIcons.store_outline,
                  ),
                ],
              ),
            ),
            verticalSpace(1),
            Container(
              color: MyColorsManager.morelightGrey,
              child: Column(
                children: [
                  ListTileWidget(
                    onTap: () {},
                    title: "Shipping Addresses",
                    leadingIcon: Icons.location_on_outlined,
                  ),
                  ListTileWidget(
                    onTap: () {},
                    title: "Settings",
                    leadingIcon: AntIcons.settingOutlined,
                  ),
                  ListTileWidget(
                    onTap: () {},
                    title: "Logout",
                    leadingIcon: AntIcons.logoutOutlined,
                  ),
                ],
              ),
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [],
            // )
          ],
        ),
      ),
    );
  }
}

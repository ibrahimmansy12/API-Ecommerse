// features/ui/main/ui/widgets/bottom_navigation_bar.dart

import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/features/logic/main/logic/main_cubit.dart';
import 'package:apiecommerse/features/ui/main/ui/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ButtomNavigatioBar extends StatelessWidget {
  const ButtomNavigatioBar({
    super.key,
    this.index,
  });
  final int? index;
  @override
  Widget build(BuildContext context) {
    var inject = BlocProvider.of<MainCubit>(context);
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        height: 7.h,
        padding:
            EdgeInsets.only(left: 3.8.w, right: 3.4.h, top: 2.h, bottom: 2.2.h),
        // margin: EdgeInsets.symmetric(horizontal: 0.2.h),
        decoration: BoxDecoration(
            color: MyColorsManager.black,
            borderRadius: BorderRadius.all(Radius.circular(2.h))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavWidget(
              onTap: () {
                inject.setPageIndex = 0;
              },
              icon: index == 0 ? Ionicons.home : Ionicons.home_outline,
            ),
            BottomNavWidget(
              onTap: () {
                inject.setPageIndex = 1;
              },
              icon: index == 1 ? Ionicons.search : Ionicons.search,
            ),
            BottomNavWidget(
              onTap: () {
                inject.setPageIndex = 2;
              },
              icon: index == 2 ? Ionicons.heart : Ionicons.heart_outline,
            ),
            BottomNavWidget(
              onTap: () {
                inject.setPageIndex = 3;
              },
              icon: index == 3 ?Ionicons.person : Ionicons.person_outline,
            ),
            // BottomNavWidget(
            //   onTap: () {
            //     inject.setPageIndex = 4;
            //   },
            //   icon: index == 4 ? Ionicons.person : Ionicons.person_outline,
            // ),
          ],
        ),
      ),
    );
  }
}

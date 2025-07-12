// features/ui/favorites/ui/favorites_screen.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/ui/favorites/ui/widget/favorite_list_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    // var inject = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(1.w),
        child: Stack(
          children: [
            Positioned(
              top: 7.4.h,
              left: 2.w,
              child: Text("My Favorites",
                  // "My Cart",
                  style: MyTextStyles.font26whitesemBold
                      .copyWith(color: MyColorsManager.black, fontSize: 24.sp)),
            ),
            FavoriteListView(),
            // CartButton(),
          ],
        ),
      ),
    );
  }
}

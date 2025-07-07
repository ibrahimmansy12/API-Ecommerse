// features/ui/seeAll/ui/widgets/see_all_tap_bar_view_column.dart
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class SeeAllTapBarViewColumn extends StatelessWidget {
  const SeeAllTapBarViewColumn({
    super.key,
    required this.productsCategoryDataList,
  });

  final List<ProductDataDetails>? productsCategoryDataList;
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      crossAxisSpacing: 0.1.h,
      mainAxisSpacing: 0.1.h,
      scrollDirection: Axis.vertical,
      staggeredTileBuilder: (int index) => StaggeredTile.extent(
          (index % 2 == 0) ? 1 : 1,
          (index % 4 == 1 || index % 4 == 3) ? 42.h : 36.h),
      itemCount: (productsCategoryDataList?.length ?? 0) >= 0
          ? productsCategoryDataList?.length
          : 2,
      itemBuilder: (context, index) {
        return ProductCard(
          topDescriptionPosi: 18.h,
          iconSize: 17.sp,
          right: index % 2 == 0 ? 1.2.w : 1.w,
          top: index % 2 == 0 ? 0.53.h : 0.5.h,
          // height: 30.h,
          // width: 60.w,
          productDataDetails: productsCategoryDataList?[index],
        );
      },
    );
  }
}

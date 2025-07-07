// features/ui/home/ui/widgets/shimmer/categories_shimmer.dart
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/home_shimmer_contents.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeShimmerCategory extends StatelessWidget {
  const HomeShimmerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: ShimmerTabBar(),
              ),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ShimmerProductCard();
                  },
                ),
              ),
              verticalSpace(1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: ShimmerSectionHeader(),
              ),
              verticalSpace(1.3),
              ShimmerLatestProducts(),
            ],
          ),
        ),
      ],
    );
  }
}

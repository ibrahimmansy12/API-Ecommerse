// features/ui/home/ui/widgets/shimmer/home_shimmer_contents.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// features/ui/home/ui/widgets/home_shimmer.dart
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

// Shimmer للـ Tab Bar
class ShimmerTabBar extends StatelessWidget {
  const ShimmerTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          horezontalSpace(12),
          Container(
            width: 30.w,
            height: 5.8.h,
            margin: EdgeInsets.only(right: 4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1.w),
            ),
          ),
          Container(
            width: 34.w,
            height: 5.8.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1.w),
            ),
          ),
        ],
      ),
    );
  }
}

// Shimmer للـ Product Card
class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({
    super.key,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        color: MyColorsManager.white,
      ),
      margin: EdgeInsets.all(1.2.w),
      height: height ?? 40.h,
      width: width ?? 60.w,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            // Shimmer للصورة
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(2.w),
                  ),
                ),
              ),
            ),
            // Shimmer للمحتوى
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان المنتج
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.5.w),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    // وصف المنتج
                    Container(
                      width: 70.w,
                      height: 1.5.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.5.w),
                      ),
                    ),
                    Spacer(),
                    // السعر والأيقونة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 15.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.5.w),
                          ),
                        ),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1.w),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Shimmer للـ Section Header
class ShimmerSectionHeader extends StatelessWidget {
  const ShimmerSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white24,
      highlightColor: Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 20.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.5.w),
            ),
          ),
          Container(
            width: 15.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.5.w),
            ),
          ),
        ],
      ),
    );
  }
}

// Shimmer للـ Latest Products
class ShimmerLatestProducts extends StatelessWidget {
  const ShimmerLatestProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(2.w),
            height: 6.h,
            width: 22.w,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: Column(
                  children: [
                    // صورة المنتج
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(2.w),
                          ),
                        ),
                      ),
                    ),
                    // تفاصيل المنتج
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(1.w),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 1.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.3.w),
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Container(
                              width: 60.w,
                              height: 0.8.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.3.w),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Shimmer للـ Search Bar (إضافي)
class ShimmerSearchBar extends StatelessWidget {
  const ShimmerSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 5.h,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.w),
        ),
      ),
    );
  }
}

// Shimmer للـ Category Grid (إضافي)
class ShimmerCategoryGrid extends StatelessWidget {
  const ShimmerCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(5.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 3.w,
        mainAxisSpacing: 3.w,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.w),
            ),
          ),
        );
      },
    );
  }
}

// Shimmer للـ Banner (إضافي)
class ShimmerBanner extends StatelessWidget {
  const ShimmerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 20.h,
        margin: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.w),
        ),
      ),
    );
  }
}

// features/ui/home/ui/widgets/shimmer/product_shimmer.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/home_shimmer_contents.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeShimmerproduct extends StatefulWidget {
  const HomeShimmerproduct({super.key});
  @override
  State<HomeShimmerproduct> createState() => _HomeShimmerproductState();
}

class _HomeShimmerproductState extends State<HomeShimmerproduct> {
  @override
  void initState() {
    getIt<ProductCubit>().getAllProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(2.3),
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
                padding: EdgeInsets.symmetric(horizontal: 5.w),
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

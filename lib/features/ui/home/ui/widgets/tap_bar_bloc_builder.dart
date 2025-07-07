// features/ui/home/ui/widgets/tap_bar_bloc_builder.dart

import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_state.dart';
<<<<<<< HEAD
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_method.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view.dart';
=======
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/categories_shimmer.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_method.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/product_shimmer.dart';
>>>>>>> 9b07b68 (Initial clean commit)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget tapBarBlocBuilder(TabController tabController) {
  return BlocBuilder<ProductCubit, ProductState>(
    builder: (context, state) {
      return state.when(
        categoriesError: (apiErrorModel) {
          return Center(
            child: Text(
              apiErrorModel.toString(),
              style: MyTextStyles.font20blackSemiBold,
            ),
          );
        },
        categoriesLoading: () {
<<<<<<< HEAD
          return const Center(child: CircularProgressIndicator());
=======
          return HomeShimmerCategory();
>>>>>>> 9b07b68 (Initial clean commit)
        },
        categoriesSuccess: (categoriesDataList) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                homeTapBardetailsMethod(context, tabController),
<<<<<<< HEAD
                HomeTapBarView()
=======
                HomeShimmerproduct()
>>>>>>> 9b07b68 (Initial clean commit)
              ],
            ),
          );
        },
        productLoading: () {
<<<<<<< HEAD
          return const Center(child: CircularProgressIndicator());
=======
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                homeTapBardetailsMethod(context, tabController),
                HomeShimmerproduct()
              ],
            ),
          );
          //return HomeShimmerproduct();
>>>>>>> 9b07b68 (Initial clean commit)
        },
        productSuccess: (productsDataList) {
          // You can customize this widget as needed
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                homeTapBardetailsMethod(context, tabController),
                HomeTapBarView(/*tabController: tabController*/)
              ],
            ),
          );
        },
        productError: (apiErrorModel) {
          return Center(
            child: Text(
              apiErrorModel.toString(),
              style: MyTextStyles.font20blackSemiBold,
            ),
          );
        },
        initial: () {
<<<<<<< HEAD
          return const Center(child: CircularProgressIndicator());
=======
          return HomeShimmerproduct();
>>>>>>> 9b07b68 (Initial clean commit)
        },
      );
    },
  );
}

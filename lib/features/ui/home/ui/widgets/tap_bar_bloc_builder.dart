// features/ui/home/ui/widgets/tap_bar_bloc_builder.dart

// features/ui/home/ui/widgets/home_tap_bar_view.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_state.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_method.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view_column.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/categories_shimmer.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeTapBarView extends StatefulWidget {
  const HomeTapBarView({
    super.key,
    required this.controller,
  });
  final TabController? controller;
  @override
  State<HomeTapBarView> createState() => _HomeTapBarViewState();
}

class _HomeTapBarViewState extends State<HomeTapBarView> {
  @override
  void initState() {
   // getIt<ProductCubit>().getAllProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  var inject = getIt<ProductCubit>();

    return SizedBox(
      height: 68.h,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return state.when(
              productLoading: () {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      homeTapBardetailsMethod(context, widget.controller,inject.categoriesDataList),
                      HomeShimmerproduct()
                    ],
                  ),
                );
              },
              productSuccess: (productData) {

                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      homeTapBardetailsMethod(context, widget.controller,inject.categoriesDataList),
                      //  HomeTapBarView(/*tabController: tabController*/)
                      productRebuildMethod(context)
                    ],
                  ),
                );
              },
              productError: (error) {
                return Center(
                  child: Text(
                    'Error: ${error.toString()}',
                    style: MyTextStyles.font20blackSemiBold,
                  ),
                );
              },
              categoriesSuccess: (categoriesSuccess) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      homeTapBardetailsMethod(context, widget.controller,
                          categoriesSuccess),
                      HomeShimmerproduct()
                    ],
                  ),
                );
              },
              categoriesError: (error) {
                return Center(
                  child: Text(
                    'Error: ${error.toString()}',
                    style: MyTextStyles.font20blackSemiBold,
                  ),
                );
              },
              initial: () {
                return HomeShimmerCategory();
              },
              categoriesLoading: () {
                return HomeShimmerCategory();
              },
            );
          },
        ),
      ),
    );
  }

  Widget productRebuildMethod(BuildContext context) {
    var inject = getIt<ProductCubit>();
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(top: 2.h, left: 5.w),
      child: TabBarView(
        controller: homeTabController,
        children: [
          HomeTapBarViewColumn(
            productDataList: inject.makeupProductsList,
          ),
          HomeTapBarViewColumn(
            productDataList: inject.electronicsProductsList,
          ),
        ],
      ),
    );
  }
}
// features/ui/home/ui/widgets/tap_bar_bloc_builder.dart

// import 'package:apiecommerse/core/theming/text_style.dart';
// import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
// import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_state.dart';
// <<<<<<< HEAD
// import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_method.dart';
// import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view.dart';
// =======
// import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/categories_shimmer.dart';
// import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_method.dart';
// import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view.dart';
// import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/product_shimmer.dart';
// >>>>>>> 9b07b68 (Initial clean commit)
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// Widget tapBarBlocBuilder(TabController tabController) {
//   return BlocBuilder<ProductCubit, ProductState>(
//     builder: (context, state) {
//       return state.when(
//         categoriesError: (apiErrorModel) {
//           return Center(
//             child: Text(
//               apiErrorModel.toString(),
//               style: MyTextStyles.font20blackSemiBold,
//             ),
//           );
//         },
//         categoriesLoading: () {
// <<<<<<< HEAD
//           return const Center(child: CircularProgressIndicator());
// =======
//           return HomeShimmerCategory();
// >>>>>>> 9b07b68 (Initial clean commit)
//         },
        // categoriesSuccess: (categoriesDataList) {
        //   return SingleChildScrollView(
        //     physics: const NeverScrollableScrollPhysics(),
        //     child: Column(
        //       children: [
        //         homeTapBardetailsMethod(context, tabController),
        //         HomeTapBarView()
        //         HomeShimmerproduct()
        //       ],
        //     ),
        //   );
        // },
//         productLoading: () {
// <<<<<<< HEAD
//           return const Center(child: CircularProgressIndicator());
// =======
          // return SingleChildScrollView(
          //   physics: const NeverScrollableScrollPhysics(),
          //   child: Column(
          //     children: [
          //       homeTapBardetailsMethod(context, tabController),
          //       HomeShimmerproduct()
          //     ],
          //   ),
          // );
//           //return HomeShimmerproduct();
// >>>>>>> 9b07b68 (Initial clean commit)
//         },
//         productSuccess: (productsDataList) {
//           // You can customize this widget as needed
          // return SingleChildScrollView(
          //   physics: const NeverScrollableScrollPhysics(),
          //   child: Column(
          //     children: [
          //       homeTapBardetailsMethod(context, tabController),
          //       HomeTapBarView(/*tabController: tabController*/)
          //     ],
          //   ),
          // );
//         },
//         productError: (apiErrorModel) {
//           return Center(
//             child: Text(
//               apiErrorModel.toString(),
//               style: MyTextStyles.font20blackSemiBold,
//             ),
//           );
//         },
//         initial: () {
// <<<<<<< HEAD
//           return const Center(child: CircularProgressIndicator());
// =======
//           return HomeShimmerproduct();
// >>>>>>> 9b07b68 (Initial clean commit)
//         },
//       );
//     },
//   );
// }

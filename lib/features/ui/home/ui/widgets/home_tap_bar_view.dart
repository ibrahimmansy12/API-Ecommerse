// features/ui/home/ui/widgets/home_tap_bar_view.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_state.dart';
<<<<<<< HEAD
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view_column.dart';
=======
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/home_shimmer_contents.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view_column.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/product_shimmer.dart';
>>>>>>> 9b07b68 (Initial clean commit)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cart/cart_cubit.dart';

class HomeTapBarView extends StatefulWidget {
  const HomeTapBarView({
    super.key,
    // this.tabController,
  });

  @override
  State<HomeTapBarView> createState() => _HomeTapBarViewState();
}

class _HomeTapBarViewState extends State<HomeTapBarView> {
  @override
  void initState() {
<<<<<<< HEAD
    getIt<ProductCubit>().getAllProductsList();
=======
   // getIt<ProductCubit>().getAllProductsList();
>>>>>>> 9b07b68 (Initial clean commit)
    super.initState();
  }

  // final TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return state.when(
              productLoading: () {
<<<<<<< HEAD
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColorsManager.red,
                  ),
                );
=======
                        return HomeShimmerproduct();

>>>>>>> 9b07b68 (Initial clean commit)
              },
              productSuccess: (productData) {
                return BlocProvider.value(
                  value: getIt<CartCubit>(),
                  child: productRebuildMethod(context),
                );
              },
              productError: (error) {
                return Center(
                  child: Text(
                    'Error: ',
                    style: MyTextStyles.font20blackSemiBold,
                  ),
                );
              },
              categoriesSuccess: (categoriesSuccess) {
                return productRebuildMethod(context);
              },
              categoriesError: (error) {
                return Center(
                  child: Text(
                    'Error: ',
                    style: MyTextStyles.font20blackSemiBold,
                  ),
                );
                // return productRebuildMethod(context);
              },
              initial: () {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColorsManager.mainblue,
                  ),
                );
              },
              categoriesLoading: () {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColorsManager.mainblue,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget productRebuildMethod(
    BuildContext context,
  ) {
    var inject = getIt<ProductCubit>();
    // List<CategoriesDataList>? categoriesDataList = inject.categoriesDataList;
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(top: 2.h, left: 5.w),
      child: TabBarView(
        controller: homeTabController,
        children: [
          HomeTapBarViewColumn(
            productDataList: inject.makeupProductsList,
            //categoriesDataList: categoriesDataList,
          ),
          HomeTapBarViewColumn(
            productDataList: inject.electronicsProductsList,
            //  categoriesDataList: categoriesDataList,
          ),
          //   HomeTapBarViewColumn(
          //     productDataList: productData,
          //  //   categoriesDataList: categoriesDataList,
          //   ),
        ],
      ),
    );
  }
}

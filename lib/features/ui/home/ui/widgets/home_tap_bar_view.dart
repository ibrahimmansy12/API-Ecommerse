// features/ui/home/ui/widgets/home_tap_bar_view.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/home_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/home_state.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
    getIt<HomeCubit>().getAllProductsList();
    super.initState();
  }

  // final TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              productLoading: () {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColorsManager.red,
                  ),
                );
              },
              productSuccess: (productData) {
                return productRebuildMethod(context);
              },
              productError: (error) {
                return Center(
                  child: Text(
                    'Error: $error',
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
                    'Error: $error',
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
    var inject = getIt<HomeCubit>();
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

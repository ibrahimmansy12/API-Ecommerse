// features/ui/home/ui/widgets/home_tap_bar_method.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/shimmer/home_shimmer_contents.dart';
import 'package:flutter/material.dart';

import '../../../../data/home/data/model/categories_model.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
Widget homeTapBardetailsMethod(
    BuildContext context, TabController? controller,List<CategoriesDatadetails?>? categoriesDataList) {
  var inject = getIt<ProductCubit>();
  print("==ddd===>>>>${inject.categoriesDataList?[0].name}");
  if (categoriesDataList.isNullOrEmpty()) {
    return Center(
      child:ShimmerTabBar(),
    );
  }
  return TabBar(
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: Colors.amber,
    controller: controller,
    isScrollable: true,
    labelColor: MyColorsManager.white,
    labelStyle: MyTextStyles.font22DarkBlueMedium,
    unselectedLabelColor: MyColorsManager.grey.withValues(
      alpha: 0.5,
    ),
    dividerHeight: 0,
    tabs: [
      Tab(
        text:categoriesDataList?[0]?.name ?? "111",
      ),
      Tab(
        text: categoriesDataList?[1]?.name ?? "222",
      ),
    ],
  );
}

Widget stackTapBardetailsMethod(
    BuildContext context, List<CategoriesDatadetails>? categoriesDataList) {
  // var inject = BlocProvider.of<HomeCategorysCubit>(context);
  // var inject = getIt<HomeCategorysCubit>();
  print("=====>>>>${categoriesDataList?[0].name}");
  // if (inject.categoriesDataList.isNullOrEmpty()) {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }
  return TabBar(
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: Colors.amber,
    controller: seeAllTabController,
    isScrollable: true,
    labelColor: MyColorsManager.white,
    labelStyle: MyTextStyles.font22DarkBlueMedium,
    unselectedLabelColor: MyColorsManager.grey.withValues(
      alpha: 0.5,
    ),
    dividerHeight: 0,
    tabs: [
      Tab(
        text: categoriesDataList?[0].name ?? "111",
      ),
      Tab(
        text: categoriesDataList?[1].name ?? "222",
      ),
      // Tab(
      //   text: inject.categoriesDataList?[2].name ?? "333",
      // ),
    ],
  );
}

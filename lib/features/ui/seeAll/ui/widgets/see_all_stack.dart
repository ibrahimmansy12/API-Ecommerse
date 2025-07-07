// features/ui/seeAll/ui/widgets/see_all_stack.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_method.dart';
import 'package:apiecommerse/features/ui/seeAll/ui/widgets/see_all_tap_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../data/home/data/model/categories_model.dart';
import '../../../../logic/categories and products/logic/categories/home_categorys_cubit.dart';
import '../../../../logic/categories and products/logic/categories/home_categorys_state.dart';

Widget seeAllStack(
    BuildContext context, List<CategoriesDatadetails>? categoriesDataList) {
  return SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/home back.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            verticalSpace(3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.close_sharp,
                      color: MyColorsManager.white,
                      size: 4.h,
                    )),
              ],
            ),
            Column(
              children: [
                stackTapBardetailsMethod(context, categoriesDataList),
                verticalSpace(1),
                SizedBox(
                  height: 84.5.h,
                  child: BlocProvider.value(
                    value: getIt<ProductCubit>(),
                    child: SeeAllTapBarView(),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Widget seeAllBlocBuilder() {
  return BlocBuilder<HomeCategorysCubit, HomeCategorysState>(
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        categoriesSuccess: (categoriesDataList) {
          return Column(
            children: [
              //  stackTapBardetailsMethod(context,categoriesDataList.cast<CategoriesDatadetails>()),
              verticalSpace(1),
              // SizedBox(
              //   height: 82.h,
              //   child: BlocProvider.value(
              //     value: getIt<HomeCubit>(),
              //     child: SeeAllTapBarView(),
              //   ),
              // ),
            ],
          );
        },
        initial: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    },
  );
}

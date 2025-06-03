// features/ui/home/ui/widgets/tap_bar_bloc_builder.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/categories/home_categorys_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/categories/home_categorys_state.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/home_cubit.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_method.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_tap_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget tapBarBlocBuilder(TabController tabController) {
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
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                homeTapBardetailsMethod(context,tabController),
                // SizedBox(
                //     width: double.infinity,
                //     child: SingleChildScrollView(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [

                //           // HomeTapBar(
                //           //   tabController: tabController!,
                //           //   categoriesDataList: categoriesDataList,
                //           // )
                //         ],
                //       ),
                //     )),
                BlocProvider.value(
              value: getIt<HomeCubit>()..getAllProductsList(),
                // create: (context) =>
                //     HomeCategorysCubit(getIt())..getCategoriesList(),
                child: HomeTapBarView(/*tabController: tabController*/),
                )
              ],
            ),
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

// features/ui/seeAll/ui/widgets/see_all_tap_bar_view.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/home_cubit.dart';
import 'package:apiecommerse/features/ui/seeAll/ui/widgets/see_all_tap_bar_view_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/categories and products/logic/products/home_state.dart';

class SeeAllTapBarView extends StatelessWidget {
  const SeeAllTapBarView({
    super.key,
    this.productsCategoryDataList,
  });
  final List<ProductDataDetails>? productsCategoryDataList;
  // @override
  @override
  Widget build(BuildContext context) {
    // var inject = BlocProvider.of<HomeCubit>(context);

    //  return seeAllTapBarViewMethod(context, widget.productsCategoryDataList);

    return seeAllHomeBlocBuilder();
  }

  Widget seeAllHomeBlocBuilder() {
    return BlocBuilder<HomeCubit, HomeState>(
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
            return seeAllTapBarViewMethod(context,);
          },
          productError: (error) {
            return Center(
              child: Text(
                'Error: $error',
                style: MyTextStyles.font20blackSemiBold,
              ),
            );
          },
          categoriesByIdLoading: () {
            return Center(
              child: CircularProgressIndicator(
                color: MyColorsManager.green,
              ),
            );
          },
          categoriesByIdSuccess: (productData) {
            return seeAllTapBarViewMethod(context, );
          },
          categoriesByIdError: (error) {
            return Center(
              child: Text(
                'Error: $error',
                style: MyTextStyles.font20blackSemiBold,
              ),
            );
          },
          initial: () {
            return Center(
              child: CircularProgressIndicator(
                color: MyColorsManager.mainblue,
              ),
            );
          },
        );
      },
    );
  }

  TabBarView seeAllTapBarViewMethod(
      BuildContext context, ) {
      var inject = getIt<HomeCubit>();
    return TabBarView(
      controller: seeAllTabController,
      children: [
        SeeAllTapBarViewColumn(productsCategoryDataList: inject.makeupProductsList,
            ),
        SeeAllTapBarViewColumn(productsCategoryDataList: inject.electronicsProductsList,
            // productDataList: inject.productsCategoryDataList,
            ),
        // SeeAllTapBarViewColumn(
        //     // productDataList:inject.productsCategoryDataList,
        //     ),
      ],
    );
  }
}

// features/ui/home/ui/widgets/home_tap_bar_view_column.dart

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/latest.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeTapBarViewColumn extends StatelessWidget {
  const HomeTapBarViewColumn({
    super.key,
    this.productDataList,
    // required this.categoriesDataList,
  });

  final List<ProductDataDetails?>? productDataList;
  // final List<CategoriesDataList>? categoriesDataList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            itemCount: (productDataList?.length ?? 0) >= 0
                ? productDataList?.length
                : 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCard(
                right: 2.w,
                top: 1.1.h,
                productDataDetails: productDataList?[index],
              );
            },
          ),
        ),
        Hero(
          tag: "productCardListview",
          child: Column(
            children: [
              verticalSpace(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest ",
                    style: MyTextStyles.font20blackSemiBold,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(ERouts.seeallscreen);
                    },
                    child: Row(
                      children: [
                        Text(
                          "See All",
                          style: MyTextStyles.font18blackmediume,
                        ),
                        Icon(AntIcons.caretRightFilled)
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(1.3),
              Latest(productDataList: productDataList!.reversed.toList()),
            ],
          ),
        )
      ],
    );
  }
}

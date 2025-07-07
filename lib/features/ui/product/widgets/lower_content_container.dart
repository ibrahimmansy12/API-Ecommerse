// features/ui/product/widgets/lower_content_container.dart

import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

 
Positioned lowerContentContainer(ProductDataDetails? productDataDetails) {
  return Positioned(
    left: 0,
    right: 0,
    top: 34.h,
    bottom: 14.h,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.h),
          topRight: Radius.circular(4.h),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productDataDetails?.name ?? "Product Title",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(1),
            rateRow(),
            verticalSpace(2.5),
            priceAndColorRow(productDataDetails),
            // Add more product details here
            verticalSpace(1),
            Text(
              "${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description}${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description} ${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}${productDataDetails?.description}",
              style: MyTextStyles.font16blackSemiBold.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Row priceAndColorRow(ProductDataDetails? productDataDetails) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "\$${productDataDetails?.price ?? "  \$80"}",
        style: MyTextStyles.font22DarkBlueMedium.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 21.sp,
        ),
      ),
      Row(
        children: [
          Text(
            "color",
            style: MyTextStyles.font14lightgrayregular.copyWith(
              fontSize: 18.sp,
              color: MyColorsManager.black,
            ),
          ),
          horezontalSpace(1.5),
          CircleAvatar(
            backgroundColor: MyColorsManager.black,
            radius: 1.2.h,
          ),
          horezontalSpace(1.5),
          CircleAvatar(
            backgroundColor: MyColorsManager.red,
            radius: 1.2.h,
          ),
        ],
      )
    ],
  );
}

Row rateRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Product Rating",
        style: MyTextStyles.font16blackSemiBold.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: MyColorsManager.grey),
      ),
      RatingBar.builder(
        initialRating: 3.5,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 22,
        itemPadding: EdgeInsets.symmetric(
          horizontal: 0.w,
        ),
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            // size: 1.6.w,
            color: Colors.amber,
          );
        },
        onRatingUpdate: (value) {},
      ),
      horezontalSpace(16),
    ],
  );
}

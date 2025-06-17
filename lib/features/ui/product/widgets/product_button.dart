// features/ui/product/widgets/product_button.dart

import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/di/dependancy_ingection.dart';
import '../../../data/cart/data/cart_model.dart';
import '../../../logic/cart/cart_cubit.dart';

Widget productButton(
  ProductHiveModel cartModel,
  BuildContext context,
) {
  return BlocProvider.value(
    value: getIt<CartCubit>(),
    child: Positioned(
        // height: 20.h,30
        top: 85.h,
        right: 4.w,
        left: 4.w,
        bottom: 6.h,
        child: MyTextButton(
          backGroundColor: MyColorsManager.black,
          buttonhight: 6.h,
          borderRadius: 2.h,
          buttonText: "Add to Bag",
          // buttonwidth: 90.w,
          textStyle: MyTextStyles.font20blackBold.copyWith(
            color: Colors.white,
            fontSize: 19.sp,
          ),
          onpressed: () async {
            await getIt<CartCubit>().addProductToCart(cartModel);
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
        )),
  );
}

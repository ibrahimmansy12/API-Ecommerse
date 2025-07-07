// features/ui/cart/ui/widgets/cart_button.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/core/widgets/app_text_button.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/features/logic/cart/cart_cubit.dart';
import 'package:apiecommerse/payment/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    this.totalPrice, // Example total price, replace with actual value
  });

  final int? totalPrice;
  @override
  Widget build(BuildContext context) {
    int getTotalPrice(List<ProductHiveModel>? cartModelList) {
      print("cartModelList======>>>$cartModelList");
      if (cartModelList == null || cartModelList.isEmpty) {
        print("Cart is empty");
        return 0;
      }
      return cartModelList.fold(1, (total, item) {
        final price = double.parse(item.price ?? '0');
        print("Item price: $price");
        return total + (price * (item.productcount ?? 1)).toInt();
      });
    }

    print("cart234++++++====>${getIt<CartCubit>().cartProductsList}");
    var inject = getIt<CartCubit>();
    int totalPrice = getTotalPrice(inject.cartProductsList);
    print("Total Price:=====> $totalPrice");
    return Positioned(
        // height: 20.h,30
        top: 92.h,
        right: 4.w,
        left: 4.w,
        bottom: 0.h,
        child: MyTextButton(
          backGroundColor: MyColorsManager.black,
          buttonhight: 6.h,
          borderRadius: 2.h,
          buttonText: "Proceed to Checkout",
          // buttonwidth: 90.w,
          textStyle: MyTextStyles.font20blackBold.copyWith(
            color: Colors.white,
            fontSize: 18.sp,
          ),
          onpressed: () async {
            print("Total Price: $totalPrice");
            await PaymentManager.makePayment(
                (totalPrice > 0) ? totalPrice : 40, "EGP");
            if (context.mounted) {
              inject.clearBox(context);
            }
            print("Cart cleared after payment");
            print("Cart products after payment: ${inject.cartProductsList}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: MyColorsManager.green,
                content: Text("Payment successful!"),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ));
  }
}

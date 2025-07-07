// features/ui/cart/ui/cart_screen.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/features/logic/cart/cart_cubit.dart';
import 'package:apiecommerse/features/ui/cart/ui/widgets/cart_button.dart';
import 'package:apiecommerse/features/ui/cart/ui/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    var inject = getIt<CartCubit>();
    inject.getCartproducts();
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(1.w),
        child: Stack(
          children: [
            Positioned(
              top: 3.25.h,
              left: 0.w,
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.close_sharp,
                    color: MyColorsManager.black,
                    size: 3.2.h,
                  )),
            ),
            Positioned(
              top: 7.4.h,
              left: 2.w,
              child: Text("My Cart",
                  style: MyTextStyles.font26whitesemBold
                      .copyWith(color: MyColorsManager.black, fontSize: 24.sp)),
            ),
            CartListView(),
            CartButton(
            ),
          ],
        ),
      ),
    );
  }

  // Positioned cartButton() {
  //   return Positioned(
  //       // height: 20.h,30
  //       top: 92.h,
  //       right: 4.w,
  //       left: 4.w,
  //       bottom: 0.h,
  //       child: MyTextButton(
  //         backGroundColor: MyColorsManager.black,
  //         buttonhight: 6.h,
  //         borderRadius: 2.h,
  //         buttonText: "Proceed to Checkout",
  //         // buttonwidth: 90.w,
  //         textStyle: MyTextStyles.font20blackBold.copyWith(
  //           color: Colors.white,
  //           fontSize: 18.sp,
  //         ),
  //         onpressed: () {},
  //       ));
  // }

  // Positioned cartListView() {
  //   return CartListView();
  //}
}

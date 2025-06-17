// features/ui/cart/ui/cart_screen.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/core/widgets/app_text_button.dart';
import 'package:apiecommerse/features/logic/cart/cart_cubit.dart';
import 'package:apiecommerse/features/logic/cart/cart_state.dart';
import 'package:apiecommerse/features/ui/cart/ui/widgets/cart_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    // var inject = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(1.w),
        child: Stack(
          children: [
            // Positioned(
            //   top: 3.25.h,
            //   left: 0.w,
            //   child: IconButton(
            //       onPressed: () {
            //         context.pop();
            //       },
            //       icon: Icon(
            //         Icons.close_sharp,
            //         color: MyColorsManager.black,
            //         size: 3.2.h,
            //       )),
            // ),
            Positioned(
              top: 7.4.h,
              left: 2.w,
              child: Text("My Cart",
                  style: MyTextStyles.font26whitesemBold
                      .copyWith(color: MyColorsManager.black, fontSize: 24.sp)),
            ),
            cartListView(),
            cartButton(),
          ],
        ),
      ),
    );
  }

  Positioned cartButton() {
    return Positioned(
        // height: 20.h,30
        top: 82.h,
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
          onpressed: () {},
        ));
  }

  Positioned cartListView() {
    return Positioned(
      top: 17.h,
      left: 3.w,
      right: 3.w,
      bottom: 0,
      child: BlocBuilder<CartCubit, CartState>(
        // buildWhen: (previous, current) =>
        //     current is Loading &&
        //     current is Success &&
        //     current is Error,
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (cartmodelList) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CartListviewItem(cartModel:  cartmodelList?[index],);
                },
                itemCount: cartmodelList?.length,
              );
            },
            error: () => const Center(child: Text("Error loading cart")),
            putsuccess: (cartmodelList, cartmodel) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CartListviewItem(cartModel:  cartmodelList?[index],);
                },
                itemCount: cartmodelList?.length,
              );
            },
          );
        },
      ),
    );
  }
}

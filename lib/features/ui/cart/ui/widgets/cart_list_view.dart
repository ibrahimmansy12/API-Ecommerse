// features/ui/cart/ui/widgets/cart_list_view.dart

import 'package:apiecommerse/features/logic/cart/cart_cubit.dart';
import 'package:apiecommerse/features/logic/cart/cart_state.dart';
import 'package:apiecommerse/features/ui/cart/ui/widgets/cart_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 14.h,
      left: 3.w,
      right: 3.w,
      bottom: 7.h,
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
                  return CartListviewItem(
                    cartModel: cartmodelList?[index],
                  );
                },
                itemCount: cartmodelList?.length,
              );
            },
            error: () => const Center(child: Text("Error loading cart")),
            putsuccess: (cartmodelList, cartmodel) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CartListviewItem(
                    cartModel: cartmodelList?[index],
                  );
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
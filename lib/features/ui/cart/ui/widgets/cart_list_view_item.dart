// features/ui/cart/ui/widgets/cart_list_view_item.dart

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/features/logic/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/text_style.dart';
import '../../../../logic/cart/cart_state.dart';

class CartListviewItem extends StatelessWidget {
  const CartListviewItem({
    super.key,
    this.cartModel,
  });

  final ProductHiveModel? cartModel;

  @override
  Widget build(BuildContext context) {
    var inject = BlocProvider.of<CartCubit>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.h),
        child: Slidable(
          key: ValueKey(0),
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) {
                // Handle delete action
                // BlocProvider.of<CartCubit>(context).removeCartProduct(cartModel);
                cartModel?.delete();
                inject.getCartproducts();
              },
              backgroundColor: MyColorsManager.black,
              foregroundColor: MyColorsManager.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ]),
          child: Container(
            height: 11.h,
            width: 92.w,
            padding:
                EdgeInsets.only(bottom: 1.h, left: 3.w, right: 5.w, top: 1.h),
            // margin: EdgeInsets.only(bottom: 1.h),
            decoration: BoxDecoration(
              color: MyColorsManager.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 9.h,
                      width: 20.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(1.h),
                          child: Image.network(
                            "https://orientonline.info/${cartModel?.image}",
                            fit: BoxFit.cover,
                          )),
                    ),
                    horezontalSpace(4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(cartModel?.name ?? "Product Name",
                            style: MyTextStyles.font16blackSemiBold.copyWith(
                              fontSize: 17.sp,
                            )),
                        Text(
                          cartModel?.description ?? "Product description",
                          style: MyTextStyles.font14lightgrayregular.copyWith(
                            fontSize: 15.sp,
                            color: MyColorsManager.darkGrey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            double price =
                                double.tryParse(cartModel?.price ?? '0') ?? 0.0;
                            num count = cartModel?.productcount ?? 1;
                            num total = price * count;
                            if (state is PutSuccess &&
                                state.cartmodel?.id == cartModel?.id) {
                              return Text("$total \$",
                                  style: MyTextStyles.font18blackmediume);
                            }
                            return Text(
                              "$total \$",
                              style: MyTextStyles.font18blackmediume,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          if ((cartModel?.productcount ?? 0) > 1) {
                            if (cartModel?.productcount != null) {
                              if (cartModel?.productcount != null) {
                                cartModel!.productcount =
                                    cartModel!.productcount! - 1;
                                inject.saveProductChanges(cartModel!);
                              }
                            }
                          }
                        },
                        child: Icon(
                          AntIcons.minusSquareOutlined,
                          size: 5.w,
                        )),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state is PutSuccess &&
                            state.cartmodel?.id == cartModel?.id) {
                          return Text(
                            "${state.cartmodel?.productcount}",
                            style: MyTextStyles.font16blackSemiBold.copyWith(
                              fontSize: 17.sp,
                            ),
                          );
                        } else {
                          return Text(
                            "${cartModel?.productcount ?? 0}",
                            style: MyTextStyles.font16blackSemiBold.copyWith(
                              fontSize: 17.sp,
                            ),
                          );
                        }
                      },
                    ),
                    InkWell(
                        onTap: () {
                          if ((cartModel?.productcount ?? 0) > 0) {
                            if (cartModel?.productcount != null) {
                              cartModel!.productcount =
                                  cartModel!.productcount! + 1;
                              inject.saveProductChanges(cartModel!);
                            }
                          }
                        },
                        child: Icon(
                          AntIcons.plusSquareFilled,
                          size: 5.w,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// features/ui/cart/ui/widgets/cart_list_view_item.dart

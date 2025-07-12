// features/ui/favorites/ui/widget/favorites_list_view_item.dart
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';


class FavoriteListViewItem extends StatelessWidget {
  const FavoriteListViewItem({
    super.key,
    this.cartModel,
  });

  final ProductHiveModel? cartModel;

  @override
  Widget build(BuildContext context) {
    var inject = BlocProvider.of<FavoritesCubit>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.h),
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
                      Text("${cartModel?.price} \$",
                          style: MyTextStyles.font18blackmediume)
                      // BlocBuilder<CartCubit, CartState>(
                      //   builder: (context, state) {
        
                      //     if (state is PutSuccess &&
                      //         state.cartmodel?.id == cartModel?.id) {
                      //       return Text("$total \$",
                      //           style: MyTextStyles.font18blackSemiBold);
                      //     }
                      //     return Text(
                      //       "$total \$",
                      //       style: MyTextStyles.font18blackSemiBold,
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    cartModel?.delete();
                    inject.getfavoritesproducts();
                  },
                  icon: Icon(Ionicons.heart_dislike))
            ],
          ),
        ),
      ),
    );
  }
}

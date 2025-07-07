// features/ui/favorites/ui/favorites_screen.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/core/widgets/app_text_button.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/helper/spacing.dart';
import '../../../data/cart/data/product_hive_model.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // @override
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
            Positioned(
              top: 7.4.h,
              left: 2.w,
              child: Text("My Favorites",
                  // "My Cart",
                  style: MyTextStyles.font26whitesemBold
                      .copyWith(color: MyColorsManager.black, fontSize: 24.sp)),
            ),
            FavoriteListView(),
            // CartButton(),
          ],
        ),
      ),
    );
  }
}

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavoritesCubit>()..getfavoritesproducts(),
      child: Positioned(
        top: 17.h,
        left: 3.w,
        right: 3.w,
        bottom: 0,
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
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
                    return FavoriteListViewItem(
                        cartModel: cartmodelList?[index]);
                  },
                  itemCount: cartmodelList?.length,
                );
              },
              error: () => const Center(child: Text("Error loading cart")),
              putsuccess: (cartmodelList, cartmodel) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return FavoriteListViewItem(
                        cartModel: cartmodelList?[index]);
                  },
                  itemCount: cartmodelList?.length,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

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
        child: Slidable(
          key: ValueKey(0),
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) {
                // Handle delete action
                // BlocProvider.of<CartCubit>(context).removeCartProduct(cartModel);
                cartModel?.delete();
                inject.getfavoritesproducts();
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
      ),
    );
  }
}

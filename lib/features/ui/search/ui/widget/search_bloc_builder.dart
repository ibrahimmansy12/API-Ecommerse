// features/ui/search/ui/widget/search_bloc_builder.dart
import 'package:apiecommerse/core/widgets/oops_widget.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/logic/search/logic/search_cubit.dart';
import 'package:apiecommerse/features/logic/search/logic/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/text_style.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      // buildWhen: (previous, current) =>
      //     current is Loading || current is Success || current is Error,
      builder: (context, state) {
        print("state ======> ${state.runtimeType}");
        return state.when(
          initial: () => const Center(
            child: Text("Search for products"),
          ),
          productError: (apiErrorModel) => OopsWidget(
            errorMessage: apiErrorModel.message,
            // onPressed: () {
            //   BlocProvider.of<SearchCubit>(context).getAllProductsList();
            // },
          ),
          productSuccess: (searchList) => onSeaerchSuccess(searchList),
          productLoading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }

  onSeaerchSuccess(List<ProductDataDetails>? searchList) {
    print("=====search home list = {${searchList?.length}}");

    return SizedBox(
      height: 67.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return SearchListviewItem(
            cartModel: searchList?[index],
          );
        },
        itemCount: searchList?.length,
      ),
    );
    //DoctorListView(doctorsList: docotrsList);
  }
}

// features/ui/cart/ui/widgets/cart_list_view_item.dart

class SearchListviewItem extends StatelessWidget {
  const SearchListviewItem({
    super.key,
    this.cartModel,
  });
  final ProductDataDetails? cartModel;

  @override
  Widget build(BuildContext context) {
    // var inject = BlocProvider.of<CartCubit>(context);

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
                      //     double price =
                      //         double.tryParse(cartModel?.price ?? '0') ?? 0.0;
                      //     num count = cartModel?.productcount ?? 1;
                      //     num total = price * count;
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
            ],
          ),
        ),
      ),
    );
  }
}
// features/ui/cart/ui/widgets/cart_list_view_item.dart

// features/ui/favorites/ui/widget/favorite_list_view.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_state.dart';
import 'package:apiecommerse/features/ui/favorites/ui/widget/favorites_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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

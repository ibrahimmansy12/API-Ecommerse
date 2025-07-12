// features/ui/favorites/ui/widget/favorites_icon.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/di/dependancy_ingection.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../data/cart/data/product_hive_model.dart';
import '../../../../logic/favorites/favorites_cubit.dart';
import '../../../../logic/favorites/favorites_state.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.productHiveModel,
    this.right,
    this.top,
    this.iconsSize,
  });
  final double? right;
  final double? top;
  final double? iconsSize;
  final ProductHiveModel? productHiveModel;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    // var favoriteRequest = FavoriteRequestModel(
    //   id: widget.cartCubit?.id,
    // );
    // var inject = getIt<FavoritesCubit>();
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is Success) {
          return favoriteIconBody(widget.right, widget.top, widget.iconsSize);
        } else {
          return favoriteIconBody(widget.right, widget.top, widget.iconsSize);
        }
      },
    );
  }

  favoriteIconBody(double? right, double? top, double? iconSize) {
    var inject = getIt<FavoritesCubit>();
    return Positioned(
        right: right ?? 2.5.w,
        top: top ?? 0.45.h,
        child: IconButton(
            onPressed: () async {
              if (inject.favoritesIdies.contains(widget.productHiveModel?.id)) {
                print(
                    "deleteed the list is ${inject.favoritBox.values.length}");
                await inject.favoritBox.delete(widget.productHiveModel!.id);
                inject.getfavoritesproducts();
                setState(() {});
              } else {
                await inject.putToFavorite(widget.productHiveModel!);
                inject.getfavoritesproducts();

                setState(() {});
              }
            },
            icon: Icon(
              inject.favoritesIdies.contains(widget.productHiveModel?.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: MyColorsManager.grey,
              size: iconSize ?? 19.5.sp,
            )));
  }
}

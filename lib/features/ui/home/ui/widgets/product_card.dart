// features/ui/home/ui/widgets/product_card.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// features/home/ui/widgets/product_card.dart
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/cart/data/cart_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/di/dependancy_ingection.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.height,
    this.width,
    this.productDataDetails,
  });
  final double? height;
  final double? width;
  final ProductDataDetails? productDataDetails;
  @override
  Widget build(BuildContext context) {
    ProductHiveModel? productHiveModel = ProductHiveModel(
      id: productDataDetails?.id,
      name: productDataDetails?.name ?? "",
      description: productDataDetails?.description ?? "",
      price: productDataDetails?.price,
      image: productDataDetails?.image ?? "",
      isFavorites: false,
    );
    return Hero(
      tag: productDataDetails?.id ?? "productCard",
      child: GestureDetector(
        onTap: () {
          context.pushNamed(ERouts.productScreen,
              arguments: productDataDetails);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ProductScreen(
          //         productDataDetails: productDataDetails,
          //       ),
          //     ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.w),
            color: MyColorsManager.white,
          ),
          padding: EdgeInsets.all(0.w),
          margin: EdgeInsets.all(1.2.w),
          height: height ?? 40.h,
          width: width ?? 60.w,
          child: Stack(
            children: [
              CardImage(productDataList: productDataDetails),
              CardDescription(productDataList: productDataDetails),
              FavoriteIcon(productHiveModel: productHiveModel)
            ],
          ),
        ),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
    this.productDataList,
  });
  final ProductDataDetails? productDataList;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 22.h,
        bottom: 2.w,
        right: 2.w,
        left: 2.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              productDataList?.name ?? "UltraBoost\nShoes",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: MyTextStyles.font22DarkBlueMedium.copyWith(
                fontWeight: FontWeight.bold,
                // fontSize: 20.sp,
                color: MyColorsManager.black,
              ),
            ),
            Text(
              productDataList?.description ?? "Men's Running",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: MyTextStyles.font16blackSemiBold
                  .copyWith(fontSize: 17.sp, color: MyColorsManager.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  " \$${productDataList?.price ?? "  \$80"}",
                  style: MyTextStyles.font22DarkBlueMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: MyColorsManager.black,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

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
        right: right ?? 2.8.w,
        top: top ?? 0.55.w,
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
// Widget homeFavoritesIcon(inject) {
//     return Positioned(
//       right: 0.w,
//       top: 0.w,
//       child: IconButton(
//           onPressed: () {
//              inject.(favoriteRequest);
//             setState(() {

//             });
//           },
//           icon: Icon(
//             // widget.productHiveModel?.isFavorites == true
//             //     ? Icons.favorite
//             //     :
//                 Icons.favorite_border,
//             color: MyColorsManager.grey,
//           )));
//   }
}

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.productDataList,
  });

  final ProductDataDetails? productDataList;

  @override
  Widget build(BuildContext context) {
    final String? imagePath = productDataList?.image;
    final String baseUrl =
        "https://orientonline.info/"; // ضع هنا رابط السيرفر الصحيح

    String? imageUrl;
    if (imagePath == null || imagePath.isEmpty) {
      imageUrl = null;
    } else if (imagePath.startsWith('http')) {
      imageUrl = imagePath;
    } else if (imagePath.startsWith('/')) {
      imageUrl = "$baseUrl$imagePath";
    } else {
      imageUrl = "$baseUrl/$imagePath";
    }

    return Positioned(
      top: 0.w,
      right: 0.w,
      left: 0.w,
      bottom: 18.h,
      child: imageUrl == null
          ? Image.asset(
              "assets/images/download.jpeg",
              fit: BoxFit.cover,
            )
          : FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: AssetImage("assets/images/download.jpeg"),
              imageErrorBuilder: (context, error, stackTrace) {
                print("error is ${error.toString()}");
                return Image.asset(
                  "assets/images/download.jpeg",
                  fit: BoxFit.cover,
                );
              },
              fit: BoxFit.cover,
            ),
    );
  }
}

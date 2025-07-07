// features/ui/home/ui/widgets/product_card.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// features/home/ui/widgets/product_card.dart
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/di/dependancy_ingection.dart';
import '../../../../logic/favorites/favorites_cubit.dart';
import '../../../favorites/ui/widget/favorites_icon.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.height,
    this.width,
    this.productDataDetails,
    this.right,
    this.top,
    this.iconSize,
    this.topDescriptionPosi,
  });
  final double? height;
  final double? width;
  final ProductDataDetails? productDataDetails;
  final double? right;
  final double? top;
  final double? iconSize;
  final double? topDescriptionPosi;

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
    return GestureDetector(
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
            CardDescription(
              productDataList: productDataDetails,
              topDescriptionPosi: topDescriptionPosi,
            ),
            BlocProvider.value(
              value: getIt<FavoritesCubit>()..getfavoritesproducts(),
              child: FavoriteIcon(
                productHiveModel: productHiveModel,
                right: right,
                top: top,
                iconsSize: iconSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
    this.productDataList,
    this.topDescriptionPosi,
  });
  final double? topDescriptionPosi;
  final ProductDataDetails? productDataList;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: topDescriptionPosi ?? 23.h,
        bottom: 1.w,
        right: 2.w,
        left: 2.w,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Spacer(),
            Text(
              productDataList?.description ?? "Men's Running",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: MyTextStyles.font16blackSemiBold
                  .copyWith(fontSize: 17.sp, color: MyColorsManager.grey),
            ),
            Spacer(),
            Spacer(),
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
// }

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
      // bottom: 21.h,
      child: imageUrl == null
          ? Image.asset(
              "assets/images/download.jpeg",
              fit: BoxFit.contain,
            )
          : FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: AssetImage("assets/images/download.jpeg"),
              imageErrorBuilder: (context, error, stackTrace) {
                print("error is ${error.toString()}");
                return Image.asset(
                  "assets/images/download.jpeg",
                  fit: BoxFit.contain,
                );
              },
              fit: BoxFit.contain,
            ),
    );
  }
}

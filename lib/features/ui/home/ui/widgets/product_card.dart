// features/ui/home/ui/widgets/product_card.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// features/home/ui/widgets/product_card.dart
import 'package:apiecommerse/core/helper/extention.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.productDataDetails,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;
  final ProductDataDetails? productDataDetails;
  @override
  Widget build(BuildContext context) {
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
              cardDescription(productDataDetails),
              //  FavoriteIcon(productDataDetails: productDataList)
            ],
          ),
        ),
      ),
    );
  }

  Positioned cardDescription(ProductDataDetails? productDataList) {
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

// class FavoriteIcon extends StatefulWidget {
//   const FavoriteIcon({
//     super.key,
//     required this.productDataDetails,
//   });

//   final ProductDataDetails? productDataDetails;

//   @override
//   State<FavoriteIcon> createState() => _FavoriteIconState();
// }

// class _FavoriteIconState extends State<FavoriteIcon> {
//   @override
//   Widget build(BuildContext context) {
//     var favoriteRequest = FavoriteRequestModel(
//       id: widget.productDataDetails?.id,
//     );
//     var inject = getIt<HomeCubit>();
//     return Positioned(
//         right: 0.w,
//         top: 0.w,
//         child: IconButton(
//             onPressed: () {
//               inject.addToFavorite(favoriteRequest);
//               setState(() {
//                 widget.productDataDetails?.isFavorite =
//                     !(widget.productDataDetails?.isFavorite ?? false);
//               });
//             },
//             icon: Icon(
//               widget.productDataDetails?.isFavorite == true
//                   ? Icons.favorite
//                   : Icons.favorite_border,
//               color: MyColorsManager.grey,
//             )));

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

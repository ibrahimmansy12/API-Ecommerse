// features/ui/seeAll/ui/widgets/see_all_card.dart
// features/see all/ui/widgets/see_all_card
// ignore_for_file: public_member_api_docs, sort_constructors_first
// features/home/ui/widgets/product_card.dart
import 'package:apiecommerse/core/helper/spacing.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SeeAllCard extends StatelessWidget {
  const SeeAllCard({
    super.key,
    this.productDataDetails,
    this.height,
    this.width,
    this.isFavorit
  });
  final double? height;
  final double? width;
  final ProductDataDetails? productDataDetails;
  final bool? isFavorit ;
  @override
  Widget build(BuildContext context) {
    
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: MyColorsManager.white,
        ),
        padding: EdgeInsets.all(1.5.w),
        margin: EdgeInsets.all(2.w),
        height: height ?? 40.h,
        width: width ?? 60.w,
        child: Stack(
          children: [
            CardImage(productDataDetails: productDataDetails),
            cardDescription(productDataDetails),
           // FavoriteIcon(productDataDetails: productDataList)
          ],
        ),
      ),
    );
  }

  Positioned cardDescription(ProductDataDetails? productDataDetails) {
    return Positioned(
        top: 22.h,
        bottom: 0.w,
        right: 0,
        left: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productDataDetails?.name ?? "UltraBoost\nShoes",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: MyTextStyles.font20blackBold,
            ),
            Text(
              productDataDetails?.description ?? "Men's Running",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                             ],
                        ),
                      ),
                      horezontalSpace(2),
                      RichText(
                        text: TextSpan(
                          children: [
                           ],
                        ),
                      ),
                    ]),
                Text(" \$${productDataDetails?.price ?? "  \$80"}",
                    style: MyTextStyles.font16blackSemiBold.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColorsManager.green,
                    )),
              ],
            ),
          ],
        ));
  }
}

// class FavoriteIcon extends StatelessWidget {
//   const FavoriteIcon({
//     super.key,
//     required this.productDataDetails,
//   });

//   final ProductDataDetails? productDataDetails;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         right: 0.w,
//         top: 0.w,
//         child: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               productDataDetails?.isFavorite == true
//                   ? Icons.favorite
//                   : Icons.favorite_border,
//               color: MyColorsManager.grey,
//             )));
//   }
// }

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.productDataDetails,
  });

  final ProductDataDetails? productDataDetails;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 1.w,
      right: 1.w,
      left: 1.w,
      bottom: 18.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.h),
        child: productDataDetails?.image != null
            ? Image.network(
                productDataDetails!.image ?? "",
                fit: BoxFit.cover,
              )
            : Image.asset("assets/images/download.jpeg", fit: BoxFit.cover),
        //  Image.asset(
        //   productDataList?.image ?? "assets/images/download.jpeg",
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}

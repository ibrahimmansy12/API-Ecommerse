// features/ui/product/widgets/build_sliver_app_bar.dart

import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/di/dependancy_ingection.dart';
import '../../../data/cart/data/product_hive_model.dart';
import '../../favorites/ui/widget/favorites_icon.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({super.key, this.productDataDetails});
  final ProductDataDetails? productDataDetails;
  @override
  Widget build(BuildContext context) {
    final String? imagePath = productDataDetails?.image;
    final String baseUrl = "https://orientonline.info/";
    ProductHiveModel? productHiveModel = ProductHiveModel(
      id: productDataDetails?.id,
      name: productDataDetails?.name ?? "",
      description: productDataDetails?.description ?? "",
      price: productDataDetails?.price,
      image: productDataDetails?.image ?? "",
      isFavorites: false,
    );
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

    return BlocProvider.value(
      value: getIt<FavoritesCubit>()..getfavoritesproducts(),
      child: SizedBox(
        width: 100.w,
        height: 38.h,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0.w,
              right: 0.w,
              child: imageUrl == null
                  ? Image.asset(
                      "assets/images/download.jpeg",
                      fit: BoxFit.cover,
                    )
                  : FadeInImage(
                      image: NetworkImage(imageUrl),
                      placeholder: AssetImage("assets/images/download.jpeg"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/download.jpeg",
                          fit: BoxFit.fitWidth,
                        );
                      },
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              top: 0.h,
              left: 0.w,
              right: 0.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Ionicons.close,
                            color: MyColorsManager.grey, size: 22.sp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Ionicons.ellipsis_horizontal,
                            color: MyColorsManager.grey, size: 22.sp),
                        onPressed: () {
                          // Add your favorite action here
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            FavoriteIcon(
              productHiveModel: productHiveModel,
              right: 8.w,
              top: 3.9.h,
              iconsSize: 24.5.sp,
            )
          ],
        ),
      ),
    );
  }
}

// Widget upperPart(BuildContext context, ProductDataDetails? productDataDetails) {
//   // final String? imagePath = productDataDetails?.image;
//   // final String baseUrl = "https://orientonline.info/";
//   // ProductHiveModel? productHiveModel = ProductHiveModel(
//   //     id: productDataDetails?.id,
//   //     name: productDataDetails?.name ?? "",
//   //     description: productDataDetails?.description ?? "",
//   //     price: productDataDetails?.price,
//   //     image: productDataDetails?.image ?? "",
//   //     isFavorites: false,
//   //   );
//   // String? imageUrl;
//   // if (imagePath == null || imagePath.isEmpty) {
//   //   imageUrl = null;
//   // } else if (imagePath.startsWith('http')) {
//   //   imageUrl = imagePath;
//   // } else if (imagePath.startsWith('/')) {
//   //   imageUrl = "$baseUrl$imagePath";
//   // } else {
//   //   imageUrl = "$baseUrl/$imagePath";
//   // }

//   // return SizedBox(
//   //   width: 100.w,
//   //   height: 38.h,
//   //   child: Stack(
//   //     children: [
//   //       Positioned(
//   //         top: 0,
//   //         left: 0.w,
//   //         right: 0.w,
//   //         child: imageUrl == null
//   //             ? Image.asset(
//   //                 "assets/images/download.jpeg",
//   //                 fit: BoxFit.cover,
//   //               )
//   //             : FadeInImage(
//   //                 image: NetworkImage(imageUrl),
//   //                 placeholder: AssetImage("assets/images/download.jpeg"),
//   //                 imageErrorBuilder: (context, error, stackTrace) {
//   //                   return Image.asset(
//   //                     "assets/images/download.jpeg",
//   //                     fit: BoxFit.fitWidth,
//   //                   );
//   //                 },
//   //                 fit: BoxFit.cover,
//   //               ),
//   //       ),
//   //       Positioned(
//   //         top: 0.h,
//   //         left: 0.w,
//   //         right: 0.w,
//   //         child: Column(
//   //           children: [
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: [
//   //                 IconButton(
//   //                   icon: Icon(Ionicons.close,
//   //                       color: MyColorsManager.grey, size: 22.sp),
//   //                   onPressed: () {
//   //                     Navigator.pop(context);
//   //                   },
//   //                 ),
//   //                 IconButton(
//   //                   icon: Icon(Ionicons.ellipsis_horizontal,
//   //                       color: MyColorsManager.grey, size: 22.sp),
//   //                   onPressed: () {
//   //                     // Add your favorite action here
//   //                   },
//   //                 ),
//   //               ],
//   //             )
//   //           ],
//   //         ),
//   //       ),
//   //       FavoriteIcon(productHiveModel: productHiveModel)
//   //     ],
//   //   ),
//   // );
//   // }

//   // return SliverAppBar(
//   //   automaticallyImplyLeading: false,
//   //   leadingWidth: 0,
//   //   title: Padding(
//   //     padding: EdgeInsets.only(bottom: 1.h),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         IconButton(
//   //           icon: Icon(Ionicons.close, color: Colors.black, size: 22.sp),
//   //           onPressed: () {
//   //             // Add your favorite action here
//   //           },
//   //         ),
//   //         IconButton(
//   //           icon: Icon(Ionicons.ellipsis_horizontal,
//   //               color: Colors.black, size: 22.sp),
//   //           onPressed: () {
//   //             // Add your favorite action here
//   //           },
//   //         ),
//   //       ],
//   //     ),
//   //   ),
//   //   expandedHeight: 34.h,
//   //   flexibleSpace: FlexibleSpaceBar(
//   //     background: Hero(
//   //       tag: productDataDetails?.id ?? "productCard",
//   //       child: imageUrl == null
//   //           ? Image.asset(
//   //               "assets/images/download.jpeg",
//   //               fit: BoxFit.fitWidth,
//   //             )
//   //           : FadeInImage(
//   //               image: NetworkImage(imageUrl),
//   //               placeholder: AssetImage("assets/images/download.jpeg"),
//   //               imageErrorBuilder: (context, error, stackTrace) {
//   //                 return Image.asset(
//   //                   "assets/images/download.jpeg",
//   //                   fit: BoxFit.fitWidth,
//   //                 );
//   //               },
//   //               fit: BoxFit.fitWidth,
//   //             ),
//   //     ),
//   //   ),
//   //   pinned: true,
//   //   snap: false,
//   //   floating: true,
//   //   backgroundColor: Colors.transparent,
//   // );
// }

// re
// Hero(
//           tag: productDataDetails?.id ?? "productCard",
//           child: imageUrl == null
//               ? Image.asset(
//                   "assets/images/download.jpeg",
//                   fit: BoxFit.fitWidth,
//                 )
//               : FadeInImage(
//                   image: NetworkImage(imageUrl),
//                   placeholder: AssetImage("assets/images/download.jpeg"),
//                   imageErrorBuilder: (context, error, stackTrace) {
//                     return Image.asset(
//                       "assets/images/download.jpeg",
//                       fit: BoxFit.fitWidth,
//                     );
//                   },
//                   fit: BoxFit.fitWidth,
//                 ),
//         ),
//      ),

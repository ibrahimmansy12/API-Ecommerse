// features/ui/product/widgets/build_sliver_app_bar.dart

import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

Widget upperPart(BuildContext context, ProductDataDetails? productDataDetails) {
  final String? imagePath = productDataDetails?.image;
  final String baseUrl = "https://orientonline.info/";

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

  return SizedBox(
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
      ],
    ),
  );
  // }

  // return SliverAppBar(
  //   automaticallyImplyLeading: false,
  //   leadingWidth: 0,
  //   title: Padding(
  //     padding: EdgeInsets.only(bottom: 1.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         IconButton(
  //           icon: Icon(Ionicons.close, color: Colors.black, size: 22.sp),
  //           onPressed: () {
  //             // Add your favorite action here
  //           },
  //         ),
  //         IconButton(
  //           icon: Icon(Ionicons.ellipsis_horizontal,
  //               color: Colors.black, size: 22.sp),
  //           onPressed: () {
  //             // Add your favorite action here
  //           },
  //         ),
  //       ],
  //     ),
  //   ),
  //   expandedHeight: 34.h,
  //   flexibleSpace: FlexibleSpaceBar(
  //     background: Hero(
  //       tag: productDataDetails?.id ?? "productCard",
  //       child: imageUrl == null
  //           ? Image.asset(
  //               "assets/images/download.jpeg",
  //               fit: BoxFit.fitWidth,
  //             )
  //           : FadeInImage(
  //               image: NetworkImage(imageUrl),
  //               placeholder: AssetImage("assets/images/download.jpeg"),
  //               imageErrorBuilder: (context, error, stackTrace) {
  //                 return Image.asset(
  //                   "assets/images/download.jpeg",
  //                   fit: BoxFit.fitWidth,
  //                 );
  //               },
  //               fit: BoxFit.fitWidth,
  //             ),
  //     ),
  //   ),
  //   pinned: true,
  //   snap: false,
  //   floating: true,
  //   backgroundColor: Colors.transparent,
  // );
}

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

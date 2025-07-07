// features/ui/home/ui/widgets/latest.dart

import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Latest extends StatelessWidget {
  const Latest({
    super.key,
    required this.productDataList,
  });

  final List<ProductDataDetails?>? productDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      child: ListView.builder(
        itemCount:
            (productDataList?.length ?? 0) >= 0 ? productDataList?.length : 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final String? imagePath = productDataList?[index]?.image;
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

          return Container(
              margin: EdgeInsets.all(2.w),
              // padding: EdgeInsets.all(3.w),
              height: 10.h,
              width: 22.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: MyColorsManager.white,
              ),
              child: imageUrl == null
                  ? Image.asset(
                      "assets/images/download.jpeg",
                      fit: BoxFit.fill,
                    )
                  : FadeInImage(
                      image: NetworkImage(imageUrl),
                      placeholder: AssetImage("assets/images/download.jpeg"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        print("error is ${error.toString()}");
                        return Image.asset(
                          "assets/images/download.jpeg",
                          fit: BoxFit.fill,
                        );
                      },
                      fit: BoxFit.cover,
                    ));
        },
      ),
    );
  }
}

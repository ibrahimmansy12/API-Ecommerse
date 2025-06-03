// features/ui/product/product_screen.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/text_style.dart';
import 'package:apiecommerse/core/widgets/app_text_button.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/ui/product/widgets/build_sliver_app_bar.dart';
import 'package:apiecommerse/features/ui/product/widgets/lower_content_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.productDataDetails});
  final ProductDataDetails? productDataDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorsManager.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(children: [
            upperPart(context, productDataDetails),
            lowerContentContainer(productDataDetails),
            Positioned(
                // height: 20.h,30
                top: 83.h,
                right: 8.w,
                left: 8.w,
                bottom: 6.h,
                child: MyTextButton(
                  backGroundColor: MyColorsManager.black,
                  buttonhight: 6.h,
                  borderRadius: 2.h,
                  buttonText: "Add to Bag",
                  // buttonwidth: 90.w,
                  textStyle: MyTextStyles.font20blackBold.copyWith(
                    color: Colors.white,
                  ),
                  onpressed: () {
                    print("Add to Bag pressed");
                  },
                ))
          ]),
        ),
      ),
    );
  }
}


   
  //       body: CustomScrollView(
  //     slivers: [
  //       upperPart(context, productDataDetails),
  //       SliverList(
  //         delegate: SliverChildBuilderDelegate(
  //           (context, index) {
  //             return Positioned(
  //               top: 10.h,
  //               child: Container(
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(10.h),
  //                     topRight: Radius.circular(10.h),
  //                   ),
  //                 ),
  //                 padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
  //                 child: Column(children:[
                
  //                   ]   ),
  //               ),
  //             );
  //           },
  //           childCount: 1,
  //         ),
  //       )
  //     ],
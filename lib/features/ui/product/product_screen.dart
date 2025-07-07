// features/ui/product/product_screen.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/ui/product/widgets/build_sliver_app_bar.dart';
import 'package:apiecommerse/features/ui/product/widgets/lower_content_container.dart';
import 'package:apiecommerse/features/ui/product/widgets/product_button.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.productDataDetails});
  final ProductDataDetails? productDataDetails;

  @override
  Widget build(BuildContext context) {
    ProductHiveModel cartModel = ProductHiveModel(
      id: productDataDetails?.id,
      name: productDataDetails?.name,
      price: productDataDetails?.price,
      image: productDataDetails?.image,
      description: productDataDetails?.description,
    );
    return Scaffold(
      backgroundColor: MyColorsManager.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(children: [
            UpperPart(productDataDetails: productDataDetails),
            lowerContentContainer(productDataDetails),
            ProductButton(cartModel: cartModel)
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
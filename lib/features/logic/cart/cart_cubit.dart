// features/logic/cart/cart_cubit.dart
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/features/logic/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  List<ProductHiveModel> cartProductsList = [];
  List cartProductsIds = [];

  addProductToCart(ProductHiveModel cartModel) async {
    cartModel.productcount = cartModel.productcount ?? 1;
    emit(CartState.loading());
    try {
      var productBox = Hive.box<ProductHiveModel>(cartBox);
      await productBox.add(cartModel);
      print("Product added to cart: ${cartModel.name}");
      print("=====> Product list cart is: ${cartProductsList.length}");
      emit(CartState.success(cartmodellist: cartProductsList));
    } on Exception catch (e) {
      print("Error adding product to cart: $e");
      emit(CartState.error());
    }
  }

//  
  saveProductChanges(ProductHiveModel cartModel) async {
    emit(CartState.loading());
    try {
      cartModel.save();
      print("=====> Product count is: ${cartModel.productcount}");

      emit(CartState.putsuccess(
          cartmodel: cartModel, cartmodellist: cartProductsList));
    } on Exception catch (e) {
      print("Error adding product to cart: $e");
      emit(CartState.error());
    }
  }
clearBox(BuildContext  context) async {
    emit(CartState.loading());
    try {
      var productBox = Hive.box<ProductHiveModel>(cartBox);
      await productBox.clear();
      cartProductsList.clear();
      cartProductsIds.clear();
       if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: MyColorsManager.green,
          content: Text("Payment successful!"),
          duration: Duration(seconds: 2),
        ),
      );
    };
      print("Cart cleared successfully");
      emit(CartState.success(cartmodellist: cartProductsList));
    } catch (e) {
       if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: MyColorsManager.red,
          content: Text("Payment error $e"),
          duration: Duration(seconds: 2),
        ),
      );
    }
    }
  }


  getCartproducts() {
    cartProductsIds=getCartIdies(cartProductsList);
    var productBox = Hive.box<ProductHiveModel>(cartBox);

    cartProductsList = productBox.values.toList();
    print("=====> Product list cart is: ${cartProductsList.length}");

    emit(CartState.success(cartmodellist: cartProductsList));
  }
}
List getCartIdies(List cartProductsList) {
   return   cartProductsList = cartProductsList.map((e) {
        cartProductsList.contains(e);
        return e.id;
      }).toList();
    }
 // List<ProductHiveModel> favoriteProductsList = [];
//       var favoritBox = Hive.box<ProductHiveModel>(favoritestBox);
//   putToFavorite(ProductHiveModel cartModel) async {
//     // cartModel.productcount = cartModel.productcount ?? 1;
//     emit(CartState.loading());
//     try {
//       await favoritBox.put(cartModel.id, cartModel);
// // favoritBox.values.contains(cartModel);
//       getfavoritesproducts();
//       print("Product put to cart: ${cartModel.name}");
//       print("=====> FAvorite list cart is: ${favoriteProductsList.length}");

//       emit(CartState.success(cartmodellist: favoriteProductsList));
//     } on Exception catch (e) {
//       print("Error adding product to cart: $e");
//       emit(CartState.error());
//     }
//   }
//  getfavoritesproducts() {
//     var productBox = Hive.box<ProductHiveModel>(favoritestBox);

//     favoriteProductsList = productBox.values.toList();
//     print("=====> Product list cart is: ${cartProductsList.length}");

//     emit(CartState.success(cartmodellist: favoriteProductsList));
//   }
  // putToFavorites(ProductHiveModel cartModel) async {
  //   emit(CartState.loading());
  //   try {
  //     cartModel.save();
  //     print("=====> Product count is: ${cartModel.productcount}");

  //     emit(CartState.putsuccess(
  //         cartmodel: cartModel, cartmodellist: cartProductsList));
  //   } on Exception catch (e) {
  //     print("Error adding product to cart: $e");
  //     emit(CartState.error());
  //   }
  // }
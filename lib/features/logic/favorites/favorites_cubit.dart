// features/logic/favorites/favorites_cubit.dart
import 'package:apiecommerse/features/logic/favorites/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/helper/constance_helper.dart';
import '../../data/cart/data/product_hive_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState.initial());

  List<ProductHiveModel> favoriteProductsList = [];
  List favoritesIdies = [];
  var favoritBox = Hive.box<ProductHiveModel>(favoritestBox);
  putToFavorite(ProductHiveModel cartModel) async {
    // cartModel.productcount = cartModel.productcount ?? 1;
    emit(FavoritesState.loading());
    try {
      await favoritBox.put(cartModel.id, cartModel);
// favoritBox.values.contains(cartModel);
      getfavoritesproducts();
      print("Product put to cart: ${cartModel.name}");
      print("=====> FAvorite list cart is: ${favoriteProductsList.length}");

      emit(FavoritesState.success(cartmodellist: favoriteProductsList));
    } on Exception catch (e) {
      print("Error adding product to cart: $e");
      emit(FavoritesState.error());
    }
  }

  getfavoritesproducts() {
    var productBox = Hive.box<ProductHiveModel>(favoritestBox);

    favoriteProductsList = productBox.values.toList();
favoritesIdies = getFavoritesIdies(favoriteProductsList);
    print("=====> Product list cart is: ${favoriteProductsList.length}");

    emit(FavoritesState.success(cartmodellist: favoriteProductsList));
  }

  saveProductChanges(ProductHiveModel cartModel) async {
    emit(FavoritesState.loading());
    try {
      cartModel.save();
      getfavoritesproducts();
      print("=====> Product count is: ${cartModel.productcount}");

      emit(FavoritesState.putsuccess(
          cartmodel: cartModel, cartmodellist: favoriteProductsList));
    } on Exception catch (e) {
      print("Error adding product to cart: $e");
      emit(FavoritesState.error());
    }
 

/**  List<ProductDataDetails> fillProductsList(int categoryId) {
    List<ProductDataDetails> products = allProductsList
        .where((element) => element.categoryId == categoryId)
        .toList();
    return products;
  } */
    //     void getDoctorsList({required int? specializationId}) {
    //   List<Doctors?>? doctorsList =
    //       getDoctorListBySpecializationId(specializationId);
    //   if (!doctorsList.isNullOrEmpty()) {
    //     emit(HomeState.doctorsSuccess(doctorsList));
    //   } else {
    //     emit(HomeState.spesilizationerror(
    //         ApiErrorModel(message: "No Doctors Found")));
    //   }
    // }
  }
  List getFavoritesIdies(List favoriteProductsList) {
   return   favoriteProductsList = favoriteProductsList.map((e) {
        favoriteProductsList.contains(e);
        return e.id;
      }).toList();
    }
  // List<ProductHiveModel> cartProductsList = [];
  // addProductToCart(ProductHiveModel cartModel) async {
  //   cartModel.productcount = cartModel.productcount ?? 1;
  //   emit(FavoritesState.loading());
  //   try {
  //     var productBox = Hive.box<ProductHiveModel>(cartBox);
  //     await productBox.add(cartModel);
  //     print("Product added to cart: ${cartModel.name}");
  //     print("=====> Product list cart is: ${cartProductsList.length}");
  //     emit(FavoritesState.success(cartmodellist: cartProductsList));
  //   } on Exception catch (e) {
  //     print("Error adding product to cart: $e");
  //     emit(FavoritesState.error());
  //   }
  // }

  // putProductofCart(ProductHiveModel cartModel) async {
  //   emit(FavoritesState.loading());
  //   try {
  //     cartModel.save();
  //     print("=====> Product count is: ${cartModel.productcount}");

  //     emit(FavoritesState.putsuccess(
  //         cartmodel: cartModel, cartmodellist: cartProductsList));
  //   } on Exception catch (e) {
  //     print("Error adding product to cart: $e");
  //     emit(FavoritesState.error());
  //   }
  // }

  // getCartproducts() {
  //   var productBox = Hive.box<ProductHiveModel>(cartBox);

  //   cartProductsList = productBox.values.toList();
  //   print("=====> Product list cart is: ${cartProductsList.length}");

  //   emit(FavoritesState.success(cartmodellist: cartProductsList));
  // }
}

// features/logic/categories and products/logic/products/product_cubit.dart

import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/data/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.homeRepo) : super(ProductState.initial());
  final HomeRepo? homeRepo;
  List<ProductDataDetails> allProductsList = [];
  List<ProductDataDetails> searchProductsList = [];
  List<ProductDataDetails> electronicsProductsList = [];
  List<ProductDataDetails> makeupProductsList = [];

  List<CategoriesDatadetails>? categoriesDataList;

  void getCategoriesList() async {
    //  emit(HomeState.categoriesLoading());

    final response = await homeRepo?.getCategories();
    response?.when(success: (productsmodel) {
      categoriesDataList = productsmodel.categoriesDatadetails ?? [];
      emit(ProductState.categoriesSuccess(categoriesDataList));
    }, failure: (error) {
      emit(ProductState.categoriesError(error));
    });
  }

  void getAllProductsList() async {
    final response = await homeRepo?.getAllProducts();
    emit(ProductState.productLoading());
    response?.when(success: (productsmodel) {
      allProductsList = productsmodel.productDataDetails ?? [];
      makeupProductsList = fillProductsList(2);
      electronicsProductsList = fillProductsList(3);
      emit(ProductState.productSuccess(allProductsList));
    }, failure: (error) {
      emit(ProductState.productError(error));
    });
  }

  List<ProductDataDetails> fillProductsList(int categoryId) {
    List<ProductDataDetails> products = allProductsList
        .where((element) => element.categoryId == categoryId)
        .toList();
    return products;
  }


}




















    // print("list ======================>>>>> ${productsDataList.toString()}");

     // print("list error ======================>>>>>${error.toString()}");
     // print("list ======================>>>>> ${productsDataList.toString()}");
     // print("list ======================>>>>> ${productsDataList.toString()}");
       //   print("list response ======================>>>>> ${response}");
  // void getMakeupProducts() async {
  //   final response = await homeRepo?.getProductsById(2);
  //   emit(HomeState.categoriesLoading());
  //   response?.when(success: (productsmodel) {
  //     electronicsProductsList = productsmodel.productDataDetails ?? [];
  //    // emit(HomeState.categoriesSuccess(electronicsProductsList));
  //   }, failure: (error) {
  //     // emit(HomeState.(error));
  //   });
  // }

  // void getCategoriesDataById(int index) async {
  //   final response = await homeRepo?.getProductsById(index);
  //   // emit(HomeState.categoriesByIdLoading());
  //   response?.when(success: (productsmodel) {
  //     electronicsProductsList = productsmodel.productDataDetails ?? [];
  //     emit(HomeState.categoriesByIdSuccess(electronicsProductsList));
  //   }, failure: (error) {
  //     emit(HomeState.categoriesByIdError(error));
  //   });
  // }

  // void addToFavorite(FavoriteRequestModel favoriteRequestModel) async {
  //   final response = await homeRepo?.addToFavorite(favoriteRequestModel);
  //   response?.when(success: (productsmodel) {}, failure: (error) {});
  // }
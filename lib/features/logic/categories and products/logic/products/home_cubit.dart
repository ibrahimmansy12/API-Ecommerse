// features/home/logic/products/home_cubit.dart

import 'package:apiecommerse/features/data/home/data/model/favorite_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/data/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeState.initial());
  final HomeRepo? homeRepo;
  List<ProductDataDetails> allProductsList = [];
  List<ProductDataDetails> electronicsProductsList = [];
  List<ProductDataDetails> makeupProductsList = [];
  void getAllProductsList() async {
    final response = await homeRepo?.getAllProducts();

    response?.when(success: (productsmodel) {
      allProductsList = productsmodel.productDataDetails ?? [];
    makeupProductsList=  fillProductsList( 2);
    electronicsProductsList=  fillProductsList( 3);
print("makeupProductsList============>>>> ${makeupProductsList.toString()}");
      print("electronicsProductsList============>>>> ${electronicsProductsList.toString()}");
      emit(HomeState.productSuccess(allProductsList));
    }, failure: (error) {
            print("pro cu error============>>>> ${error.toString()}");

      emit(HomeState.productError(error));
    });
  }

 List<ProductDataDetails>  fillProductsList( int categoryId) {
   List<ProductDataDetails> products=
        allProductsList
            .where((element) => element.categoryId == categoryId)
            .toList();
return products;
  }

  void getMakeupProducts() async {
    final response = await homeRepo?.getProductsById(2);
    emit(HomeState.categoriesByIdLoading());
    response?.when(success: (productsmodel) {
      electronicsProductsList = productsmodel.productDataDetails ?? [];
      emit(HomeState.categoriesByIdSuccess(electronicsProductsList));
    }, failure: (error) {
      emit(HomeState.categoriesByIdError(error));
    });
  }

  void getCategoriesDataById(int index) async {
    final response = await homeRepo?.getProductsById(index);
    emit(HomeState.categoriesByIdLoading());
    response?.when(success: (productsmodel) {
      electronicsProductsList = productsmodel.productDataDetails ?? [];
      emit(HomeState.categoriesByIdSuccess(electronicsProductsList));
    }, failure: (error) {
      emit(HomeState.categoriesByIdError(error));
    });
  }

  void addToFavorite(FavoriteRequestModel favoriteRequestModel) async {
    final response = await homeRepo?.addToFavorite(favoriteRequestModel);
    response?.when(success: (productsmodel) {}, failure: (error) {});
  }
}
    // print("list ======================>>>>> ${productsDataList.toString()}");

     // print("list error ======================>>>>>${error.toString()}");
     // print("list ======================>>>>> ${productsDataList.toString()}");
     // print("list ======================>>>>> ${productsDataList.toString()}");
       //   print("list response ======================>>>>> ${response}");

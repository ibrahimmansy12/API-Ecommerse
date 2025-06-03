// features/data/home/data/repo/home_repo.dart

import 'package:apiecommerse/core/networking/api_handler.dart';
import 'package:apiecommerse/core/networking/api_result.dart';
import 'package:apiecommerse/core/networking/api_service.dart';
import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:apiecommerse/features/data/home/data/model/favorite_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);
  Future<ApiResult<ProductModel>> getAllProducts() async {
    try {
      final responce = await apiService.getProducts();
      print("pro repo respo============>>>> ${responce.toString()}");

      return ApiResult.success(responce);
    } catch (e) {
      // Log the error
      print("All pro repo error============>>>> ${e.toString()}");
      return ApiResult.failure(ApiHandler.handle(e));
    }
  }

  Future<ApiResult<CategoriesModel>> getCategories() async {
    try {
      final responce = await apiService.getCategories();
      print("cat repo respanse============>>>> ${responce.toString()}");
      return ApiResult.success(responce);
    } catch (e) {
      // Log the error
      print("cat repo error============>>>> ${e.toString()}");
      return ApiResult.failure(ApiHandler.handle(e));
    }
  }

  Future<ApiResult<ProductModel>> getProductsById(int index) async {
    try {
      final responce =
          await apiService.getCategoriesProductByIndex(index: index);

      return ApiResult.success(responce);
    } catch (e) {
      // Log the error
      return ApiResult.failure(ApiHandler.handle(e));
    }
  }

  Future<ApiResult<FavoriteResponseModel>> addToFavorite(
      FavoriteRequestModel favoriteRequestModel) async {
    try {
      final responce = await apiService.addToFavorite(
          token:
              "iFRcJGyyOfBMNbFnTieQpqdUxN0ahmaqDgMqGNSM9inPzQSsiTNqGlMBRwHw716koQt6YS",
          favoriteRequestModel: favoriteRequestModel);

      return ApiResult.success(responce);
    } catch (e) {
      // Log the error
      return ApiResult.failure(ApiHandler.handle(e));
    }
  }
}

/*"lPMpcA2WIudXNhXDrn3fGMdpkZKVmvCPJ49uGRjGdRTrbBIpjWfy66YDPdsforqvJiIU4T"*/

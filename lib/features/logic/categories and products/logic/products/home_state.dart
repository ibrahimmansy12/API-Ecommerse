// features/logic/categories and products/logic/products/home_state.dart
import 'package:apiecommerse/core/networking/api_error_model.dart';
import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.productLoading() = ProductLoading;
  const factory HomeState.productSuccess(  List<ProductDataDetails> productsDataList) = ProductSuccess;
  const factory HomeState.productError(  ApiErrorModel apiErrorModel) = ProductError;
  

  const factory HomeState.categoriesLoading() = CategoriesLoading;
   const factory HomeState.categoriesSuccess(  List<CategoriesDatadetails?>? categoriesDataList) = CategoriesSuccess;
  const factory HomeState.categoriesError(  ApiErrorModel apiErrorModel) = CategoriesError;

}

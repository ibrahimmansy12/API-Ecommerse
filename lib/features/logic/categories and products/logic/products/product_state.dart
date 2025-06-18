// features/logic/categories and products/logic/products/product_state.dart
import 'package:apiecommerse/core/networking/api_error_model.dart';
import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.productLoading() = ProductLoading;
  const factory ProductState.productSuccess(
      List<ProductDataDetails> productsDataList) = ProductSuccess;
  const factory ProductState.productError(ApiErrorModel apiErrorModel) =
      ProductError;

  const factory ProductState.categoriesLoading() = CategoriesLoading;
  const factory ProductState.categoriesSuccess(
      List<CategoriesDatadetails?>? categoriesDataList) = CategoriesSuccess;
  const factory ProductState.categoriesError(ApiErrorModel apiErrorModel) =
      CategoriesError;
}

// features/logic/categories and products/logic/categories/home_categorys_state.dart

import 'package:apiecommerse/core/networking/api_error_model.dart';
import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_categorys_state.freezed.dart';
@freezed
class HomeCategorysState with _$HomeCategorysState {
  const factory HomeCategorysState.initial() = _Initial;
  
  const factory HomeCategorysState.categoriesLoading() = CategoriesLoading;
  const factory HomeCategorysState.categoriesSuccess(  List<CategoriesDatadetails?>? categoriesDataList) = CategoriesSuccess;
  const factory HomeCategorysState.categoriesError(  ApiErrorModel apiErrorModel) = CategoriesError;
}

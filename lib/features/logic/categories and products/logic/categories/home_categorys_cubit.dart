// features/logic/categories and products/logic/categories/home_categorys_cubit.dart

import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:apiecommerse/features/data/home/data/repo/home_repo.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/categories/home_categorys_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategorysCubit extends Cubit<HomeCategorysState> {
  HomeCategorysCubit(this.homeRepo) : super(HomeCategorysState.initial());
  final HomeRepo? homeRepo;

  List<CategoriesDatadetails>? categoriesDataList;



  void getCategoriesList() async {
    emit(HomeCategorysState.categoriesLoading());

    final response = await homeRepo?.getCategories();
    response?.when(success: (productsmodel) {
      print(
          "cat cu repo============>>>> ${productsmodel.categoriesDatadetails?[1].toString()}");

      categoriesDataList = productsmodel.categoriesDatadetails ?? [];
      emit(HomeCategorysState.categoriesSuccess(categoriesDataList));
    }, failure: (error) {
      emit(HomeCategorysState.categoriesError(error));
    });
  }
}

// features/logic/search/logic/search_cubit.dart

import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/home/data/model/prudact_model.dart';
import '../../../data/home/data/repo/home_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchState.initial());

  final HomeRepo? homeRepo;
  List<ProductDataDetails> allProductsList = [];
  List<ProductDataDetails> searchProductsList = [];
  TextEditingController? searchTextEdtingcontroller;

    void getAllProductsList() async {
    final response = await getIt< ProductCubit>().homeRepo?.getAllProducts();
    emit(SearchState.productLoading());
    response?.when(success: (productsmodel) {
      allProductsList = productsmodel.productDataDetails ?? [];
     
      emit(SearchState.productSuccess(allProductsList));
    }, failure: (error) {
      emit(SearchState.productError(error));
    });
  }
    searchForProductWithName(String doctorName) {
    emit(SearchState.productLoading());

    searchProductsList = allProductsList
        .where((doctor) => doctor.name!.toLowerCase().startsWith(doctorName))
        .toList();
    emit(SearchState.productSuccess(searchProductsList));
    print("=========filter list{$searchProductsList}");
    // print("=========doctorName{$doctorslist}");
  }
}

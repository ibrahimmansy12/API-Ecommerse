// core/di/dependancy_ingection.dart

import 'package:apiecommerse/core/networking/api_service.dart';
import 'package:apiecommerse/core/networking/dio_factory.dart';
import 'package:apiecommerse/features/data/home/data/repo/home_repo.dart';
import 'package:apiecommerse/features/data/login/data/repo/login_repo.dart';
import 'package:apiecommerse/features/data/signup/data/signup%20repo/signup_repo.dart';
import 'package:apiecommerse/features/logic/cart/cart_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/categories/home_categorys_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:apiecommerse/features/logic/log%20in/logic/cubit/login_cubit.dart';
import 'package:apiecommerse/features/logic/main/logic/main_cubit.dart';
import 'package:apiecommerse/features/logic/signup/logic/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/logic/search/logic/search_cubit.dart';

final getIt = GetIt.instance;
Future<void> detupGetit() async {
  //Doi and Apiservice
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<ProductCubit>(() => ProductCubit(getIt()));
  getIt.registerLazySingleton<HomeCategorysCubit>(
      () => HomeCategorysCubit(getIt()));

  getIt.registerFactory<MainCubit>(() => MainCubit());
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  getIt.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit());

//   //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
// // home page
//   getIt.registerLazySingleton<SpesilizationRepo>(
//       () => SpesilizationRepo(getIt()));
// //search
// getIt.registerLazySingleton<SearchRepo>(
//       () => SearchRepo(getIt()));
}

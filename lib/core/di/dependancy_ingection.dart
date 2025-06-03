// core/di/dependancy_ingection.dart

import 'package:apiecommerse/core/networking/api_service.dart';
import 'package:apiecommerse/core/networking/dio_factory.dart';
import 'package:apiecommerse/features/data/home/data/repo/home_repo.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/categories/home_categorys_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/home_cubit.dart';
import 'package:apiecommerse/features/logic/main/logic/main_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> detupGetit() async {
  //Doi and Apiservice
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

 //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() =>HomeCubit(getIt()));
  getIt.registerLazySingleton<HomeCategorysCubit>(() =>HomeCategorysCubit(getIt()));



  getIt.registerFactory<MainCubit>(() => MainCubit());

//   //signup
//   getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
//   getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

// // home page
//   getIt.registerLazySingleton<SpesilizationRepo>(
//       () => SpesilizationRepo(getIt()));
// //search
// getIt.registerLazySingleton<SearchRepo>(
//       () => SearchRepo(getIt()));
}

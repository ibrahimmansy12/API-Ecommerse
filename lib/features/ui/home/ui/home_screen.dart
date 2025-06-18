// features/ui/home/ui/home_screen.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/ui/home/ui/widgets/home_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    homeTabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: double.infinity,
            child: BlocProvider.value(
                value: getIt<ProductCubit>()..getCategoriesList(),
                child: HomeStack(tabController: homeTabController))));
  }
}




















































 // @override
  // void dispose() {
  //   homeTabController?.dispose();
  //   super.dispose();
  // }
/**BlocBuilder<HomeCategorysCubit, HomeCategorysState>(
            
            builder: (context, state) {
              return state.when(
                categoriesError: (apiErrorModel) {
                  return Center(
                    child: Text(
                      apiErrorModel.toString(),
                      style: MyTextStyles.font20blackSemiBold,
                    ),
                  );
                },
                categoriesLoading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                categoriesSuccess: (categoriesDataList) {
                  return homeStack(
                    categoriesDataList,homeTabController
                  );
                },
                initial: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          )),
    */
/**getCategoriesDataById(
              BlocProvider.of<HomeCategorysCubit>(context)
                  .categoriesDataList[0]
                  .id!), */////////////
// ///
// BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
//         return state.when(
//           initial: () {
//             return Center(
//               child: Text(
//                 "initial....",
//                 style: MyTextStyles.font20blackSemiBold,
//               ),
//             );
//           },
//           categoriesSuccess: (categoriesDataList) {
//             return homeTapBardetailsMethod(
//                 widget.tabController!, categoriesDataList);
//           },
//           productError: (error) {
//             return Padding(
//               padding: EdgeInsets.only(top: 29.h, left: 5.w),
//               child: Center(
//                 child: Text(
//                   error.toString(),
//                   style: MyTextStyles.font14lightgrayregular,
//                 ),
//               ),
//             );
//           },
//           productLoading: () {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//           productSuccess: (productList) {
//             var inject = BlocProvider.of<HomeCubit>(context);
//             print("productSuccess");
//             print("productList.length ==============> ${productList.length}");
//             return homeTapBardetailsMethod(
//                 widget.tabController!, inject.categoriesDataList);
//           },
//           categoriesLoading: () {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//           categoriesError: (error) {
//             return Center(
//               child: Text(
//                 "Categories Error: $error",
//                 style: MyTextStyles.font20blackSemiBold,
//               ),
//             );
//           },
//           categoriesByIdLoading: () {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//           categoriesByIdSuccess: (categoriesByIdList) {
//             var inject = BlocProvider.of<HomeCubit>(context);
//             return homeTapBardetailsMethod(
//                 widget.tabController!,inject.categoriesDataList);
//           },
//           categoriesByIdError: (error) {
//             return Center(
//               child: Text(
//                 "Categories By ID Error: $error",
//                 style: MyTextStyles.font14lightgrayregular,
//               ),
//             );
//           },
          // orElse: () {
          //   var inject = BlocProvider.of<HomeCubit>(context);
          //   if (inject.categoriesDataList.isNullOrEmpty()) {
          //       return const Center(
          //     child: CircularProgressIndicator(),
          //   );

          //   } else {  return homeTapBardetailsMethod(widget.tabController!,
          //       BlocProvider.of<HomeCubit>(context).categoriesDataList,
          //   );}
          //   // return const Center(
          //   //   child: CircularProgressIndicator(),
          //   // );
          //   // return homeTapBardetailsMethod(widget.tabController!,
          //   //     BlocProvider.of<HomeCubit>(context).categoriesDataList,
          //   // );
          // },
      //   );
      // }),
    
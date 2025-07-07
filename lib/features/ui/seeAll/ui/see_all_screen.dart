// features/ui/seeAll/ui/see_all_screen.dart
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/features/data/home/data/model/categories_model.dart';
import 'package:apiecommerse/features/ui/seeAll/ui/widgets/see_all_stack.dart';
import 'package:flutter/material.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({
    super.key,
    required this.categoriesDataList,
  });
  final List<CategoriesDatadetails>? categoriesDataList;
  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    seeAllTabController = TabController(length: 2, vsync: this);
    seeAllTabController?.index = homeTabController!.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: seeAllStack(context, widget.categoriesDataList),
    );
    //   return BlocProvider(
    //     create: (context) => HomeCubit(getIt()),
    //     child: Scaffold(body: BlocBuilder<HomeCategorysCubit, HomeCategorysState>(
    //       builder: (context, state) {
    //         return state.when(
    //           categoriesError: (apiErrorModel) {
    //             return Center(
    //               child: Text(
    //                 apiErrorModel.toString(),
    //                 style: MyTextStyles.font20blackSemiBold,
    //               ),
    //             );
    //           },
    //           categoriesLoading: () {
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           },
    //           categoriesSuccess: (categoriesDataList) {
    //             return seeAllStack(context, widget.categoriesDataList,
    //                 widget.tabController, widget.productsCategoryDataList);
    //           },
    //           initial: () {
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           },
    //         );
    //       },
    //     )),
    //   );
    // }
  }
}

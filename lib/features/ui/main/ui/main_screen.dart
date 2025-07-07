// features/ui/main/ui/main_screen.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:apiecommerse/features/logic/main/logic/main_cubit.dart';
import 'package:apiecommerse/features/logic/main/logic/main_state.dart';
import 'package:apiecommerse/features/logic/search/logic/search_cubit.dart';
import 'package:apiecommerse/features/ui/favorites/ui/favorites_screen.dart';
import 'package:apiecommerse/features/ui/home/ui/home_screen.dart';
import 'package:apiecommerse/features/ui/main/ui/widgets/bottom_navigation_bar.dart';
import 'package:apiecommerse/features/ui/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search/ui/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).setPageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return state.maybeWhen(
          setPageIndex: (index) {
            return mainScafould(index);
          },
          orElse: () {
            return pageList[0];
          },
        );
      },
    );
  }
}

List<Widget> pageList = [
  HomeScreen(),
  BlocProvider.value(
    value: getIt<SearchCubit>()..getAllProductsList(),
    child: SearchScreen(),
  ),
  BlocProvider.value(
    value: getIt<FavoritesCubit>(),
    child: FavoritesScreen(),
  ),
  ProfileScreen(),
];

Widget mainScafould(int index) {
  return Scaffold(
    bottomNavigationBar: ButtomNavigatioBar(index: index),
    body: pageList[index],
  );
}

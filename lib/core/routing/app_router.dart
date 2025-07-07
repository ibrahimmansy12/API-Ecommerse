// core/routing/app_router.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/features/data/home/data/model/prudact_model.dart';
import 'package:apiecommerse/features/logic/cart/cart_cubit.dart';
import 'package:apiecommerse/features/logic/categories%20and%20products/logic/products/product_cubit.dart';
import 'package:apiecommerse/features/logic/favorites/favorites_cubit.dart';
import 'package:apiecommerse/features/logic/log%20in/logic/cubit/login_cubit.dart';
import 'package:apiecommerse/features/logic/main/logic/main_cubit.dart';
import 'package:apiecommerse/features/logic/signup/logic/cubit/signup_cubit.dart';
import 'package:apiecommerse/features/ui/cart/ui/cart_screen.dart';
import 'package:apiecommerse/features/ui/login/ui/login_screen.dart';
import 'package:apiecommerse/features/ui/main/ui/main_screen.dart';
import 'package:apiecommerse/features/ui/product/product_screen.dart';
import 'package:apiecommerse/features/ui/seeAll/ui/see_all_screen.dart';
import 'package:apiecommerse/features/ui/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/ui/favorites/ui/favorites_screen.dart';

class MyAppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case ERouts.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => MainCubit(),
              ),
              BlocProvider.value(
                value: getIt<FavoritesCubit>()..getfavoritesproducts(),
                child: FavoritesScreen(),
              ),
            ],
            child: MainScreen(),
          ),
        );
      case ERouts.seeallscreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<ProductCubit>(),
              ),
              BlocProvider.value(
                value: getIt<FavoritesCubit>()..getfavoritesproducts(),
              ),
            ],
            child: SeeAllScreen(
              categoriesDataList:
                  getIt<ProductCubit>().categoriesDataList ?? [],
            ),
          ),
        );
      case ERouts.productScreen:
        var productDataDetails = settings.arguments as ProductDataDetails;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getIt<ProductCubit>(),
            child: ProductScreen(
              productDataDetails: productDataDetails,
            ),
          ),
        );
/**
  BlocProvider.value(
    value: getIt<CartCubit>(),
    child: CartScreen(),
  ), */
      case ERouts.favoriteScreen:
        //var productDataDetails = settings.arguments as cart;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getIt<FavoritesCubit>(),
            child: FavoritesScreen(),
          ),
        );
      case ERouts.cartscreen:
        //var productDataDetails = settings.arguments as cart;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getIt<CartCubit>(),
            child: CartScreen(),
          ),
        );
      case ERouts.loginScreen:
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: LoginScreen(),
                ));
 case ERouts.signupScreen:
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: SignupScreen(),
                ));
      default:
        return null;
    }
  }
}

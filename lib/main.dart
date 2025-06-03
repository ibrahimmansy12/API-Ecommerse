// main.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/bloc_observer.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/routing/app_router.dart';
import 'package:apiecommerse/deco_app.dart';
import 'package:apiecommerse/features/data/cart/data/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  detupGetit();

  await Hive.initFlutter();

  Bloc.observer = AddBlocObserver();
  Hive.registerAdapter(CartModelAdapter());

  await Hive.openBox<CartModel>(cartBox);

  runApp(Ecommerse(
    approuting: MyAppRouter(),
  ));
}

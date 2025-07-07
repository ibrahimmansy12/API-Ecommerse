// main.dart
import 'package:apiecommerse/core/di/dependancy_ingection.dart';
import 'package:apiecommerse/core/helper/bloc_observer.dart';
import 'package:apiecommerse/core/helper/constance_helper.dart';
import 'package:apiecommerse/core/routing/app_router.dart';
import 'package:apiecommerse/deco_app.dart';
import 'package:apiecommerse/features/data/cart/data/product_hive_model.dart';
import 'package:apiecommerse/payment/stripe_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  detupGetit();
    WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey=ApiKeys.pusblishableKey;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  await Hive.initFlutter();

  Bloc.observer = AddBlocObserver();
  Hive.registerAdapter(ProductHiveModelAdapter());

  cartBoxbox = await Hive.openBox<ProductHiveModel>(cartBox);
  favoritestBoxbox = await Hive.openBox<ProductHiveModel>(favoritestBox);

  runApp(Ecommerse(
    approuting: MyAppRouter(),
  ));
}

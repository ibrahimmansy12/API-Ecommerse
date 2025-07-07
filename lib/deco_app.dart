// deco_app.dart

import 'package:apiecommerse/core/routing/app_router.dart';
import 'package:apiecommerse/core/routing/routs.dart';
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Ecommerse extends StatelessWidget {
  const Ecommerse({super.key, this.approuting});
  final MyAppRouter? approuting;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme:
            ThemeData(scaffoldBackgroundColor: MyColorsManager.scafouldrColor),
        debugShowCheckedModeBanner: false,
        title: 'Ecommerse',
        initialRoute: ERouts.mainScreen,
        onGenerateRoute: approuting
            ?.generateRouter, // Replace with your actual home screen widget
      );
    });
  }
}

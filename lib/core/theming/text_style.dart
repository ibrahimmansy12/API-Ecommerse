// core/theming/text_style.dart
import 'package:apiecommerse/core/theming/colors_manager.dart';
import 'package:apiecommerse/core/theming/font_weigh_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyTextStyles {
  static TextStyle font14lightgrayregular = TextStyle(
      fontSize: 13.sp,
      fontWeight: MyFontWeighHelper.regular,
      color: MyColorsManager.lightGrey);

  static TextStyle font14DarkBlueMedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: MyFontWeighHelper.mediume,
      color: MyColorsManager.darkblue);
  static TextStyle font22DarkBlueMedium = TextStyle(
      fontSize: 22.sp,
      fontWeight: MyFontWeighHelper.mediume,
      color: MyColorsManager.darkblue);
  static TextStyle font18DarkBlueSemiBold = TextStyle(
      fontSize: 18.sp,
      fontWeight: MyFontWeighHelper.semiBold,
      color: MyColorsManager.darkblue);
  static TextStyle font20blackSemiBold = GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: MyFontWeighHelper.semiBold,
      color: MyColorsManager.black);
       static TextStyle font16blackSemiBold = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: MyFontWeighHelper.semiBold,
      color: MyColorsManager.black);
  static TextStyle font20blackBold = GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: MyFontWeighHelper.bold,
      color: MyColorsManager.black);
  static TextStyle font18blackSemiBold = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: MyFontWeighHelper.mediume,
      color: MyColorsManager.black);
  static TextStyle font30darkbluesemBold = TextStyle(
      fontSize: 30.sp,
      fontWeight: MyFontWeighHelper.bold,
      color: MyColorsManager.darkblue);
  static TextStyle font26whitesemBold = GoogleFonts.poppins(
      fontSize: 26.sp,
      fontWeight: MyFontWeighHelper.bold,
      color: MyColorsManager.white);
}

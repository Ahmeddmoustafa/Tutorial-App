import 'package:flutter/material.dart';
import 'package:flutter_dev/Resources/colors_manager.dart';
import 'package:flutter_dev/Resources/fonts_manager.dart';
import 'package:flutter_dev/Resources/styles_manager.dart';
import 'package:flutter_dev/Resources/values_manager.dart';

ThemeData getApplicationtheme(bool dark) {
  if (dark) {
    return ThemeData(
      primaryColor: ColorManager.DarkGrey,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorManager.DarkGrey,
      ),
      appBarTheme: AppBarTheme(
        color: ColorManager.DarkGrey,
        shadowColor: ColorManager.LightGrey,
        centerTitle: true,
        elevation: AppSize.s8,
        titleTextStyle: getBoldStyle(
          color: ColorManager.DarkGrey,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
          color: ColorManager.DarkGrey,
          fontsize: FontSize.s16,
        ),
        bodyLarge: getRegularStyle(
          color: ColorManager.DarkGrey,
        ),
      ),
    );
  }
  return ThemeData(
    // ******************* Main Colors **********************
    primaryColor: ColorManager.PrimaryColor,
    primaryColorLight: ColorManager.LightGrey,
    primaryColorDark: ColorManager.Black,
    splashColor: ColorManager.LightGrey,
    // disabled color

    // ******************** CardView theme ********************
    cardTheme: CardTheme(
      color: ColorManager.White,
      shadowColor: ColorManager.LightGrey,
      elevation: AppSize.s8,
    ),

    // ******************** Appbar theme ********************

    appBarTheme: AppBarTheme(
      color: ColorManager.PrimaryColor,
      shadowColor: ColorManager.LightGrey,
      centerTitle: true,
      elevation: AppSize.s8,
      titleTextStyle: getBoldStyle(
        color: ColorManager.DarkGrey,
      ),
    ),

    // ******************** button theme ********************
//cant use this
    // buttonTheme: ButtonThemeData(
    //   minWidth: 500,
    //   height: 100.0,
    //   shape: const StadiumBorder(),
    //   disabledColor: ColorManager.DarkGrey,
    //   buttonColor: ColorManager.PrimaryColor,
    //   focusColor: ColorManager.DarkGrey,
    //   splashColor: ColorManager.PrimaryColor,
    // ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.White,
          fontsize: FontSize.s18,
        ),
        backgroundColor: ColorManager.PrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // ******************** Text theme ********************

    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorManager.PrimaryColor,
        fontsize: FontSize.s16,
      ),
      bodyLarge: getRegularStyle(color: ColorManager.DarkGrey),
    ),
    // ******************** Input theme ********************

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManager.DarkGrey,
        fontsize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
        fontsize: FontSize.s14,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.PrimaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // focused border color
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.LightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // ******************* ERROR border color ********************
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.PrimaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      /************************************************************ */
    ),
  );
}
